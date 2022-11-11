
<template>
  <div>
    <div class="row mt-5 pt-5 mb-3">
      <div class="col-md-6"></div>
      <div class="col-md-6">
        <div class="row">
          <div class="col-md-6">
            <button class="btn btn-primary" @click="createpost">Create</button>
          </div>
          <div class="col-md-5">
            <form @submit.prevent="posts">
              <div class="input-group">
                <input
                  type="search"
                  class="form-control rounded"
                  placeholder="Search"
                  aria-label="Search"
                  aria-describedby="search-addon"
                  v-model="search"
                />
                <button type="submit" class="btn btn-outline-primary">
                  search
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <div class="row mx-0">
      <div class="col-md-5">
        <h2 class="pb-2">{{ isEditMode ? "Edit" : "Create" }}</h2>
        <div class="card">
          <form
            action=""
            class="pt-5"
            @submit.prevent="isEditMode ? update() : onUpload()"
          >
            <div class="row mb-4">
              <div class="col-md-3">
                <label for="" class="text-right mb-4 pl-4">Title</label>
              </div>
              <div class="col-md-8">
                <input
                  type="text"
                  v-model="post.title"
                  placeholder="Enter title"
                  class="form-control"
                  name="title"
                />
                <small
                  v-if="this.error.title"
                  class="text-danger font-weight-bolder"
                  v-html="this.error.title"
                />
              </div>
            </div>

            <div class="row mb-4">
              <div class="col-md-3">
                <label for="" class="text-right mb-4 pl-4">Image</label>
              </div>
              <div class="col-md-8">
                <img
                  :src="'http://127.0.0.1:8000/' + post.image"
                  width="100px"
                  height="100px"
                  alt="img"
                  v-if="isEditMode"

                />

                <input
                  type="file"
                  name="image"
                  @change="onFileSelected"
                  class="form-control pt-1"
                  v.model="post.image"
                   ref="null"
                />
                <small
                  v-if="this.error.image"
                  class="text-danger font-weight-bolder"
                  v-html="this.error.image"
                />
              </div>
            </div>

            <div class="row mb-4">
              <div class="col-md-3"></div>
              <div class="col-md-8">
                <button class="btn btn-primary" type="submit">
                  {{ isEditMode ? "update" : "Add" }}
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
      <div class="col-md-7 col-sm-7">
        <table class="table text-center">
          <tr class="table-danger">
            <th>ID</th>
            <th>Title</th>
            <th>Image</th>
            <th>Action</th>
          </tr>

          <tr v-for="post in postsData.data" :key="post.id">
            <th scope="row">{{ post.id }}</th>
            <td>
              {{ post.title }}
            </td>
            <td>
              <img
                :src="'http://127.0.0.1:8000/' + post.image"
                width="100px"
                height="100px"
                alt="img"
              />
            </td>
            <td>
              <button class="btn btn-success btn-sm" @click="edit(post)">
                Edit
              </button>
              <button class="btn btn-danger btn-sm" @click="destory(post.id)">
                Del
              </button>
            </td>
          </tr>
        </table>
        <vs-pagination
          :total-pages="totalpages"
          @change="posts"
        ></vs-pagination>
      </div>
    </div>
  </div>
</template>

<script>
import Form from "vform";
import axios from "axios";
import Vue from "vue";
import VsPagination from "@vuesimple/vs-pagination";
import Swal from "sweetalert2";

Vue.component("vs-pagination", VsPagination);
export default {
  middleware: ["auth"],
  data() {
    return {
      isEditMode: false,
      postsData: {},
      img: [],
      search: "",
      error: {
        title: "",
        image: "",
      },
      post: new Form({
        id: "",
        title: "",
        image: "",
      }),

      totalpages: 0,
      selectedFile: null,
    };
  },

  methods: {
    async posts(page = 1) {
      const response = await axios.get(
        `http://127.0.0.1:8000/api/post?page=${page}&search=${this.search}`
      );
      this.postsData = response.data;
      this.totalpages = response.data.last_page;
    },
    createpost() {
      this.isEditMode = false;
      this.post.id = "";
      this.post.title = "";
      this.post.image = "";
    },

    onFileSelected(event) {
      this.post.image = event.target.files[0];
    },

    onUpload() {
      this.post
        .post("http://127.0.0.1:8000/api/post/create")
        .then((response) => {
          this.posts();
          this.post.id = "";
          this.post.title = "";
          this.post.image = "";
        })
        .catch((error) => {
          error.response.data.errors.title
            ? (this.error.title = error.response.data.errors.title[0])
            : (this.error.title = "");
          error.response.data.errors.image
            ? (this.error.image = error.response.data.errors.image[0])
            : (this.error.image = "");
        });
    },

    edit(post) {
      this.isEditMode = true;
      this.post.id = post.id;
      this.post.title = post.title;
      this.post.image = post.image;
    },

    update() {
      this.post
        .post(`http://127.0.0.1:8000/api/post/edit/${this.post.id}`)
        .then((response) => {
          this.posts();
          this.post.id = "";
          this.post.title = "";
          this.post.image = "";
        });
    },
    destory(id) {
      Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!",
      }).then((result) => {
        if (result.isConfirmed) {
          axios
            .delete(`http://127.0.0.1:8000/api/post/delete/${id}`)
            .then((response) => {
              this.posts();
              Swal.fire("Deleted!", "success");
            });
        }
      });
    },
  },

  created() {
    this.posts();
  },
};
</script>
