Vue.component('login-modal', function(resolve, reject){
    axios.get('/html/components/login-modal.component.html').then(function(response){
        console.log(response)
        resolve({
            template: response.data
        })
    })
})
Vue.component('signup-modal', function(resolve, reject){
    axios.get('/html/components/signup-modal.component.html').then(function(response){
        console.log(response)
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
            path: '/search-results',
            component: function(){
                return axios.get('/html/components/search-results.component.html').then(function(response){
                    return { template: response.data }
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
                ingredients: [{name:'four gallons of shredded cheese'},{name:'pallet of noodles'}]
            },
            miniSearchForm: {
                searchTerm: 'lasagna'
            }
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
                this.$router.push('search-results')
                console.log(response)
            })
        },
        getFreshData: function(){
            axios.get('/user').then( (response)=>{
                console.log(response)
                if ( response.data.id ) {
                    this.user = response.data
                }
            }).catch((err)=>{
                console.log(err)
            })
        },
    },
    created: function(){
        this.getFreshData()
    }
})