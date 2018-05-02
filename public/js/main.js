console.log('hello!')

// creating a View-Model for the list
var mainVm = new Vue({
    el: '#app',
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