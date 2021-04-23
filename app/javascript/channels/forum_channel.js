import consumer from "./consumer"

const scroll_bottom = () => {
  const messages = document.querySelector(".message-box")
  if (!messages) {return}
  messages.scrollTop = messages.scrollHeight
}

document.addEventListener('turbolinks:load', () => {
  const messageBox = document.querySelector('.message-box');

  if (!messageBox) {return}

  const forum_id = messageBox.getAttribute('data-forum-id')
  const user_id = messageBox.getAttribute('data-user-id')
  console.log(`forum_id: ${forum_id}, user_id: ${user_id}`)

  // Had heck of a time trying to figure out how to disconnect subscription when clicking on different forums
  // Finally found a youtube that had a 'janky' way of removing, will figure my own way out time permitting
  // https://youtu.be/s3CmHhDjuWc?t=4663
  consumer.subscriptions.subscriptions.forEach(subscription => {
    consumer.subscriptions.remove(subscription);
  })
  
  consumer.subscriptions.create({ channel: "ForumChannel", forum_id: forum_id}, {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log(`Connected to Forum Channel ${forum_id}`)
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log(data.html)
      messageBox.innerHTML += (data.html)
      scroll_bottom()
    }
  });

})

