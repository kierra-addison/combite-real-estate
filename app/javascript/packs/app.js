import Vue from 'vue';
const Api = require('./api');
// Vue.use(turbolinksAdapter); // For 'yarn add vue-turbolinks'?

document.addEventListener("turbolinks:load", () => {
  var app = new Vue({
    el: '#app',
    components: {
      'post' : {
        props: ['post'],
        template: 
        ` <div class="text-center">
            <h2>MAP</h2>
            <div class="embed-responsive embed-responsive-4by3">
              <span class="embed-responsive-item" v-html="post.google_map_embed">
            </div>
          </div>
        `
      }
    },
    data: {
      posts: []
    },
    computed: {},
    methods: {
      listPosts: function() {
        Api.listPosts().then(function(response) {
          app.posts = response;
        })
      },

      currentPost: function(id) {
        return this.posts.filter(item => item.id == id);
      }
    },

    beforeMount() { this.listPosts() }
  })
});