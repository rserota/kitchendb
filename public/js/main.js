console.log('hello!')

// creating a View-Model for the list
var mainVm = new Vue({
    el: '#app',
    data: {

        alerts    : [],
        signupForm : {},
        loginForm: {},
    },
    computed: {

    },
    methods: {
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