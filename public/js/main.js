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
            component: function(){
                return axios.get('/html/components/home.component.html').then(function(response){
                    return { template: response.data }
                })
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
            path: '/my-dishes',
            component: function(){
                return axios.get('/html/components/my-dishes.component.html').then(function(response){
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
            path: '/my-menus',
            component: function(){
                return axios.get('/html/components/my-menus.component.html').then(function(response){
                    return { template: response.data }
                })
            }
        },
        {
            path: '/my-account',
            component: function(){
                return axios.get('/html/components/my-account.component.html').then(function(response){
                    return { template: response.data }
                })
            }
        },
        {
            path: '/search-results/:query',
            component: function(){
                return axios.get('/html/components/search-results.component.html').then(function(response){
                    return { 
                        template: response.data,
                        created: function(){
                            // console.log('route', this.$route)
                            if ( !this.$parent.currentSearchTerm && this.$route.params.query ) {
                                this.$parent.forms.miniSearchForm.searchTerm = this.$route.params.query
                                this.$parent.submitMiniSearchForm()
                            }
                        }
                    }
                })
            }
        },
        {
            path: '/dish/:id',
            component: function(){
                return axios.get('/html/components/dish.component.html').then(function(response){
                    return { 
                        template: response.data,
                        methods: {
                            getData : function(){
                                axios.get('/dish', {
                                    params: {
                                        id: this.$route.params.id
                                    }
                                }).then((response)=>{
                                    // console.log('response? ', response)
                                    // console.log('this? ', this)
                                    this.$parent.dish = response.data
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
        },
        {
            path: '/menu/:id',
            component: function(){
                return axios.get('/html/components/menu.component.html').then(function(response){
                    return { 
                        template: response.data,
                        methods: {
                            getData : function(){
                                axios.get('/menu', {
                                    params: {
                                        id: this.$route.params.id
                                    }
                                }).then((response)=>{
                                    console.log('menu response? ', response)
                                    // console.log('this? ', this)
                                    this.$parent.menu = response.data
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
        dish   : [], // a single dish that is being viewed
        dishes : [], // a list of a user's dishes
        menu   : [], // all dishes for a single menu
        menus  : [], // list of menus e.g. in my-menus
        alerts : [],
        currentSearchTerm : '',
        forms  : {

            signupForm : {
                username: '',
                email:'',
                password:''
            },
            loginForm: {
                email: '',
                password:''
            },
            createDishForm: {
                name: '',
                description: "",
                ingredients: [{name:''},{name:''}],
                preparation: ""
            },
            createMenuForm: {
                name: "",
                description: ""
            },
            miniSearchForm: {
                searchTerm: ''
            }
        },
        searchResults: {
            dishByName: [],
            dishByIngredient: [],
        }
    },
    computed: {

    },
    methods: {
        submitSignupForm: function(){
            axios.post('/user', this.forms.signupForm).then( (response)=>{
                console.log(response)
                this.alerts.push(response.data.alert)
                if ( response.data.success ) { $('#signup-modal').modal('hide') }
                this.getFreshData()
            }).catch((err)=>{
                console.log(err)
                this.alerts.push({
                    heading: "Signup Failed:",
                    body:  `Try again later.`,
                    class: 'alert-danger'
                })
            })
        },
        submitLoginForm: function(){
            axios.post('/user/login', this.forms.loginForm).then( (response)=>{
                console.log(response)
                if ( response.data.alert ) { this.alerts.push(response.data.alert) }
                if ( response.data.success ) { $('#login-modal').modal('hide') }
                this.getFreshData()
            }).catch((err)=>{
                console.log(err)
                this.alerts.push({
                    heading: "Login Failed:",
                    body:  `Try again later.`,
                    class: 'alert-danger'
                })
            })
        },
        submitCreateMenuForm: function(){
            axios.post('/menu', this.forms.createMenuForm).then( (response)=>{
                console.log(response)
                this.alerts.push(response.data.alert)
                this.getFreshData()
            }).catch((err)=>{
                console.log(err)
            })
        },
        submitCreateDishForm: function(){
            axios.post('/dish', this.forms.createDishForm).then( (response)=>{
                console.log(response)
                this.alerts.push(response.data.alert)
                this.getFreshData()
            }).catch((err)=>{
                console.log(err)
            })
        },
        submitMiniSearchForm: function(){
            if ( !this.forms.miniSearchForm.searchTerm.length ) { return }
            let q = this.forms.miniSearchForm.searchTerm
            this.currentSearchTerm = q
            this.forms.miniSearchForm.searchTerm = ''
            axios.get(`/search/?q=${q}`).then( (response)=>{
                this.searchResults.dishByName = response.data
                this.$router.push(`/search-results/${q}`)
                console.log(response)
            })
            axios.get(`/search`, {
                params: {
                    q,
                    searchBy: 'ingredient'
                }
            }).then( (response)=>{
                this.searchResults.dishByIngredient = response.data
                console.log(response)
            })
        },
        addDishToMenu: function(menu){
            axios.put(`/menu/${menu.menu_id}`, {dish:this.dish[0],menu}).then( (response)=>{
                console.log('resonse? ', response)
                this.alerts.push(response.data.alert)
                // this.getFreshData()
            }).catch((err)=>{
                console.log(err)
            })
        },
        getFreshData: function(){
            axios.get('/user').then( (response)=>{
                console.log('the user? ', response)
                if ( response.data[0] ) {

                    if ( response.data[0].menu_id ) {
                        this.menus = response.data
                    }
                    if ( response.data[0].id ) {
                        this.user = response.data[0]
                        axios.get('/user/dish').then( (response)=>{
                            this.dishes = response.data
                        })
                    }
                }
                else { console.log('no user.')}
                
            }).catch((err)=>{
                console.log(err)
            })

        },
        truncate: function(str, limit) {
            if ( !str ) { return '' }
            if ( !limit ) { limit = 60 }
            if ( str.length < limit ) { return str }
            else { return str.slice(0, limit) + '...' }
        }
    },
    created: function(){
        this.getFreshData()
    }
})