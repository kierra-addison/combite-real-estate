import axios from 'axios';

// export function listPosts() {
//   return axios.get('/admin/posts.json').then(function(response) {
//     return response.data;
//   })
// }

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