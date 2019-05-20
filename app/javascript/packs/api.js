import axios from 'axios';

axios.defaults.headers.common['X-CSRF-Token'] = document
  .querySelector('meta[name="csrf-token"]')
  .getAttribute('content')

export function listPosts() {
  return axios.get('/posts/search.json').then(function(response) {
    return response.data;
  })
}

export function listMessages() {
  return axios.get('/admin/messages.json').then(function(response) {
    return response.data;
  })
}

export function createMessage(message) {
  var localMessage = message;

  return axios.post('/admin/messages.json', localMessage).then(function(response) {
    return response.data;
  }).catch(function(error) {
    console.log(error);
  })
}

export function updateMessage(message) {
  var messageId = message.id;
  var localMessage = { email: message.email,
                        first_name: message.first_name,
                        last_name: message.last_name,
                        mobile_number: message.mobile_number,
                        enquiry: message.enquiry,
                        read: message.read,
                        created_at: message.created_at,
                        updated_at: message.updated_at };

  return axios.put(`/admin/messages/${messageId}.json`, localMessage).then(function(response) {
    return response.data;
  }).catch(function(error) {
    console.log(error);
  })
}

export function deleteMessage(message_id) {
  return axios.delete(`/admin/messages/${message_id}.json`).then(function(response) {
    return 'success';
  }).catch(function(error) {
    console.log(error);
  })
}

// export function currentPost(post_id) {
//   return axios.get(`/posts/${post_id}.json`).then(function(response) {
//     return response.data;
//   })
// }