import axios from 'axios';

export function listPosts() {
  return axios.get('/admin/posts.json').then(function(response) {
    return response.data;
  })
}