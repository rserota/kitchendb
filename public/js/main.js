Vue.component('login-modal', function(resolve, reject){
    axios.get('/html/components/login-modal.component.html').then(function(response){
        // console.log(response)
        resolve({
            template: response.data
        })
    })
})
Vue.component('signup-modal', function(resolve, reject){
    axios.get('/html/components/signup-modal.component.html').then(function(response){
        // console.log(response)
        resolve({
            template: response.data
        })
    })
})
// Vue.component('create-a-dish', function(resolve, reject){
//     axios.get('/html/components/create-a-dish.component.html').then(function(response){
//         console.log(response)
//         resolve({
//             template: response.data
//         })
//     })
// })



const router = new VueRouter({
    routes: [
        {
            path: '/',
            component: {
                template: '#home-template'
            }
        },
        {
            path: '/create-a-dish',
            component: function(){
                return axios.get('/html/components/create-a-dish.component.html').then(function(response){
                    return { template: response.data }
                })
            }
        },
        {
            path: '/create-a-menu',
            component: function(){
                return axios.get('/html/components/create-a-menu.component.html').then(function(response){
                    return { template: response.data }
                })
            }
        },
        {
            path: '/search-results',
            component: function(){
                return axios.get('/html/components/search-results.component.html').then(function(response){
                    return { template: response.data }
                })
            }
        },
        {
            path: '/dish/:id',
            component: function(){
                return axios.get('/html/components/dish.component.html').then(function(response){
                    return { 
                        template: response.data,
                        data: function(){
                            return {
                                dish: {}
                            }
                        },
                        methods: {
                            getData : function(){
                                axios.get('/dish', {
                                    params: {
                                        id: this.$route.params.id
                                    }
                                }).then((response)=>{
                                    console.log('response? ', response)
                                    // console.log('this? ', this)
                                    this.dish = response.data
                                })
                            }
                        },
                        created: function(){
                            this.getData()
                        },
                        watch: {
                            '$route': 'getData'
                        }
                    }
                })
            }
        }
    ]
})
// creating a View-Model for the list
var mainVm = new Vue({
    el: '#app',
    router: router,
    data: {
        user   : {},
        alerts : [],
        forms  : {
            signupForm : {
                username: 'jan',
                email:'jan.smith@gmail.com',
                password:'dragons'
            },
            loginForm: {
                email: 'jan.smith@gmail.com',
                password:'dragons'
            },
            createDishForm: {
                name: 'Lasagna',
                description: "Just like grandma used to make.\n\nServes 3 to 5.",
                ingredients: [{name:'four gallons of shredded cheese'},{name:'pallet of noodles'}],
                preparation: "Weave noodles. Apply cheese. Heat and serve."
            },
            createMenuForm: {
                name: "Four course feast",
                description: "yum yum yum... yum."
            },
            miniSearchForm: {
                searchTerm: 'lasagna'
            }
        },
        searchResults: {
            dishByName: []
        }
    },
    computed: {

    },
    methods: {
        submitSignupForm: function(){
            axios.post('/user', this.forms.signupForm).then( (response)=>{
                console.log(response)
            }).catch((err)=>{
                console.log(err)
            })
        },
        submitLoginForm: function(){
            axios.post('/user/login', this.forms.loginForm).then( (response)=>{
                console.log(response)
            }).catch((err)=>{
                console.log(err)
            })
        },
        submitCreateMenuForm: function(){
            axios.post('/menu', this.forms.createMenuForm).then( (response)=>{
                console.log(response)
                this.alerts.push(response.data.alert)
            }).catch((err)=>{
                console.log(err)
            })
        },
        submitCreateDishForm: function(){
            axios.post('/dish', this.forms.createDishForm).then( (response)=>{
                console.log(response)
                this.alerts.push(response.data.alert)
            }).catch((err)=>{
                console.log(err)
            })
        },
        submitMiniSearchForm: function(){
            let q = this.forms.miniSearchForm.searchTerm
            axios.get(`/search/?q=${q}`).then( (response)=>{
                this.$router.push('/search-results')
                this.searchResults.dishByName = response.data
                console.log(response)
            })
        },
        getFreshData: function(){
            axios.get('/user').then( (response)=>{
                console.log(response)
                if ( response.data[0].id ) {
                    this.user = response.data[0]
                }
            }).catch((err)=>{
                console.log(err)
            })
        },
        truncate: function(str, limit) {
            if ( !limit ) { limit = 60 }
            if ( str.length < limit ) { return str }
            else { return str.slice(0, limit) + '...' }
        }
    },
    created: function(){
        this.getFreshData()
    }
})