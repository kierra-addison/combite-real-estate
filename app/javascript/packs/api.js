import axios from 'axios';

export function listPosts() {
  return axios.get('/posts/search.json').then(function(response) {
    return response.data;
  })
}

export function listMessages() {
  return axios.get('/messages.json').then(function(response) {
    return response.data;
  })
}

export function createMessage(message) {
  var localMessage = message;

  return axios.post('/messages.json', localMessage).then(function(response) {
    return response.data;
  }).catch(function(error) {
    console.log(error);
  })
}

// export function currentPost(post_id) {
//   return axios.get(`/posts/${post_id}.json`).then(function(response) {
//     return response.data;
//   })
// }