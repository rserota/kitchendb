console.log('hello!')

// creating a View-Model for the list
var mainVm = new Vue({
    el: '#app',
    data: {

        alerts    : [],
        forms: {
            signupForm : {
                username: 'jan',
                email:'jan.smith@gmail.com',
                password:'dragons'
            },
            loginForm: {},
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
        getFreshData: function(){
            axios.get('/user').then( (response)=>{
                console.log(response)
                this.list      = response.data.items
                this.code      = response.data.code
                this.sortOrder = response.data.sortOrder
            }).catch((err)=>{
                console.log(err)
            })
        },
    },
    created: function(){
        this.getFreshData()
    }
})