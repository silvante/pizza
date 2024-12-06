import consumer from "channels/consumer"

consumer.subscriptions.create("OrderChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("admin connected to #order channel");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("admin disconnected to #order channel");
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const OrderContainer = document.getElementById("order-container");
    if (!OrderContainer) {
      console.error("#order-list element is not in the DOM!");
    }

    const newOrderDiv = document.createElement("div")
    newOrderDiv.classList.add("order")
    newOrderDiv.innerHTML = data.order_data

    if (data.status === "checked") {
      OrderContainer.appendChild(newOrderDiv)
    }
  }
});
