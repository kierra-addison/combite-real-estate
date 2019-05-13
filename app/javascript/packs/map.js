import Vue from 'vue';
const Api = require('./api');
// Vue.use(turbolinksAdapter); // For 'yarn add vue-turbolinks'?

document.addEventListener("turbolinks:load", () => {
  var map = new Vue({
    el: '#map',
    components: {
      'post' : {
        props: ['post'],
        template: 
        ` <div class="text-center">
            <h2>LOCATION MAP</h2>
            <div class="embed-responsive embed-responsive-4by3">
              <span class="embed-responsive-item" v-html="post.google_map_embed"></span>
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
          map.posts = response;
        })
      },

      currentPost: function(id) {
        return this.posts.filter(item => item.id == id);
      }
    },

    beforeMount() { this.listPosts() }
  })
});