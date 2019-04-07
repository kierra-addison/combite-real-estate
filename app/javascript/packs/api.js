import axios from 'axios';

export function listPosts() {
  return axios.get('/posts.json').then(function(response) {
    return response.data;
  })
}