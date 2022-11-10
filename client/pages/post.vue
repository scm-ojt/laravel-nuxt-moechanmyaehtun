
<template>
<div>
<div class="row mt-5 pt-5 mb-3">
<div class="col-md-6">

</div>
<div class="col-md-6">
  <div class="row">
    <div class="col-md-6">
      <button class="btn btn-primary " @click="createpost">Create</button>
    </div>
    <div class="col-md-6">
      <div class="input-group">
  <div class="form-outline">
    <input type="search" id="form1" class="form-control" placeholder="search"/>

  </div>
  <button type="button" class="btn btn-primary">
    search
  </button>
</div>
    </div>
  </div>

</div>
</div>
<div class="row mx-0 ">
<div class="col-md-5">
<h2 class="pb-2">{{isEditMode ?'Edit' : 'Create' }} </h2>
<div class="card">
<form action="" class="pt-5" @submit.prevent="isEditMode ? update():onUpload()">
  <div class="row mb-4">
  <div class="col-md-3">
    <label for="" class="text-right mb-4 pl-4" >Title</label>
  </div>
  <div class="col-md-8">
     <input type="text" v-model="post.title" placeholder="Enter title" class="form-control " name="title"  >

  </div>
</div>


  <div class="row mb-4">
  <div class="col-md-3">
    <label for="" class="text-right mb-4 pl-4">Image</label>
  </div>
  <div class="col-md-8">
     <img :src="'http://127.0.0.1:8000/'+ post.image" width="100px" height="100px" alt="img"   @submit.prevent="isEditMode ? edit('post'):onUpload()">
      <input type="file" @change="onFileSelected" class="form-control ">
  </div>
</div>


  <div class="row mb-4">
  <div class="col-md-3">

  </div>
  <div class="col-md-8">
   <button class="btn btn-primary"  type="submit" >{{ isEditMode ?'update' : 'Add' }}</button>
  </div>
</div>


</form>
</div>
</div>
<div class="col-md-7 col-sm-7">
  <table class="table text-center " >

    <tr class="table-danger">
      <th  >ID</th>
      <th  >
        Title
      </th>
      <th >
        Image
      </th>
      <th  >Action</th>
    </tr>

    <tr v-for="post in postsData " :key="post.id">
      <th scope="row">{{ post.id }}</th>
      <td >
          {{post.title}}
      </td>
      <td>
          <img :src="'http://127.0.0.1:8000/'+ post.image" width="100px" height="100px" alt="img">
      </td>
      <td >
        <button class="btn btn-success btn-sm" @click="edit(post)">Edit</button>
        <button class="btn btn-danger btn-sm" @click="destory(post.id)">Del</button>
      </td>
    </tr>

  </table>

</div>
</div>
</div>
</template>

<script>

import axios from "axios"
export default {
  data() {
    return{
      isEditMode:false,
      postsData:[],
      img:[],
      post:{
        id:'',
        title:'',
        image:'',
      },
      selectedFile:null
    }
  },

  methods:{
        async posts() {
            const response = await axios.get('http://127.0.0.1:8000/api/post');
            console.log(response.data);
            this.postsData=response.data;

        },
        createpost(){
          this.isEditMode=false;
        this.post.id = '';
        this.post.title = '';
        this.post.image = '';},

        onFileSelected(event){
          this.selectedFile = event.target.files[0]
        },

        onUpload(){
          const fd = new FormData();
          fd.append('image',this.selectedFile,this.selectedFile.name)
          fd.append('title',this.post.title)
          axios.post('http://127.0.0.1:8000/api/post/create',fd)

          .then(response =>{this.posts();
           this.post.id = post.id;
        this.post.title = post.title;
        this.post.image = post.image;

          })
        },

      edit(post){

        this.isEditMode=true;
        this.post.id = post.id;
        this.post.title = post.title;
        this.post.image = post.image;

      },

      update(){

          const data = new FormData();
          data.append('image',this.selectedFile,this.selectedFile.name)
          data.append('title',this.post.title)
         axios.post(`http://127.0.0.1:8000/api/post/edit/${this.post.id}` , data)

          .then(response =>{this.posts();
           this.post.id = post.id;
        this.post.title = '';
        this.post.image = '';

          })
      },
      destory(id){

        axios.delete(`http://127.0.0.1:8000/api/post/delete/${id}`)
        .then(response => this.posts());
      }
    },

      created (){
        this.posts()
       },

  }
</script>
