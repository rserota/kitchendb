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
Vue.component('create-a-dish', function(resolve, reject){
    axios.get('/html/components/create-a-dish.component.html').then(function(response){
        console.log(response)
        resolve({
            template: response.data
        })
    })
})



const router = new VueRouter({
    routes: [
        {
            path: '/',
            component: {
                template: '#home-template'
            }
        }
    ]
})
// creating a View-Model for the list
var mainVm = new Vue({
    el: '#app',
    router: router,
    data: {
        user: {},
        alerts    : [],
        forms: {
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
                description: "Just like grandma used to make.\n\nServes 3 to 5."
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