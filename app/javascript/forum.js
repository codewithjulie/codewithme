const clickEdit = document.addEventListener('click', event => {
  let clickedElement = event.target

  if (clickedElement.className === "edit") {
    let forum_id = clickedElement.getAttribute("data-forum-id")
    let post_id = clickedElement.getAttribute("data-post-id")
    let response_id =  clickedElement.getAttribute("data-response-id")

    if (response_id) {
      fetch(`/forums/${forum_id}/posts/${post_id}/responses/${response_id}/edit`).then(response => {
        response.text().then(text => {
          let postFunctions = clickedElement.closest('.post-functions');
          let message = postFunctions.previousElementSibling;
          message.innerHTML = text;
          scroll_bottom();
        })
      })
    } else {
      fetch(`/forums/${forum_id}/posts/${post_id}/edit`).then(response => {
        response.text().then(text => {
          let postFunctions = clickedElement.closest('.post-functions');
          let message = postFunctions.previousElementSibling;
          message.innerHTML = text;
          message.innerHTML.autofocus
          scroll_bottom();
        })
      })
    }
  }
})

const clickReply = document.addEventListener('click', event => {
  let clickedElement = event.target

  if (clickedElement.className === "reply") {
    let forum_id = clickedElement.getAttribute("data-forum-id")
    let post_id = clickedElement.getAttribute("data-post-id")

    fetch(`/forums/${forum_id}/posts/${post_id}/responses/new`).then(response => {
      response.text().then(text => {
        let postFunctions = clickedElement.closest('.post-message-box');
        let replyBox = postFunctions.nextElementSibling;
        replyBox.innerHTML = text;
        scroll_bottom();
      })
    })
  }
})

const populatePostList = postListElement => {
  id = postListElement.getAttribute('data-forum-id');
  fetch(`/forums/${id}/posts`).then(response => {
    response.text().then(text => {
      postListElement.innerHTML = text;
      scroll_bottom();
    })
  })
}

const reloadPostList = () => {
  let postListElement = document.querySelector('.message-box')
  if (!postListElement) {return}
  populatePostList(postListElement)
}

document.addEventListener('turbolinks:load', reloadPostList);


const scroll_bottom = () => {
  const messages = document.querySelector(".message-box")
  if (!messages) {return}
  messages.scrollTop = messages.scrollHeight
}

document.addEventListener('turbolinks:load', () => {
  scroll_bottom()
});
