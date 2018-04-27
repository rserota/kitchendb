console.log('hello!')

// creating a View-Model for the list
var listVm = new Vue({
    el: '#app',
    data: {
        newItem   : '',
        code      : '',
        sortOrder : 1,
        list      : [],
        alerts    : [],
    },
    computed: {
        sortedList: function(){
            if ( this.sortOrder === -1 ) {
                return this.list.reverse()
            }
            else { return this.list.slice() }
        }
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
        postNewItem: function(){
            const matched = this.list.filter((item)=>{
                return item.text === this.newItem
            })
            if ( matched.length > 0 ) {
                this.alerts.push({heading: "Error: Duplicate Entry.", body: `You've already added "${this.newItem}" to the list.`})
                this.newItem = ''
                return
            }
            axios.post('/item', {item: this.newItem}).then( (response)=>{
                this.getFreshData()
            }).catch((err)=>{
                console.log(err)
                this.getFreshData()
            })
            this.list.push({text:this.newItem, done:false})
            this.newItem = ''
        },
        completeItem: function(item){
            item.done = !item.done
            axios.put(`/item/${item._id}`).then( (response)=>{
                this.getFreshData()
            }).catch(function(err){
                this.getFreshData()
            })
        },
        deleteItem: function(item){
            axios.delete(`/item/${item._id}`).then( (response)=>{
                this.getFreshData()
            }).catch(function(err){
                console.log(error)
            })
        },
        sortItems: function(){
            this.sortOrder = -this.sortOrder
            console.log(this)
            axios.post('/user/sort').then( (response)=>{
                this.getFreshData()
            })
        }
    },
    created: function(){
        this.getFreshData()
    }
})