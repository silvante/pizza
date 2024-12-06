import consumer from "channels/consumer"

consumer.subscriptions.create("OrderChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("ordering channels are connected!!!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("ordering channels are disconnected!!!");
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const OrderContainer = document.getElementById("order-container");
    const OrderContainerForDelivery = document.getElementById(`order-container-delivery-${data.delivery_id}`);

    if (!OrderContainerForDelivery) {
      console.log("#order-list element is not in the DOM!");
    }

    if (!OrderContainer) {
      console.log("#order-list element is not in the DOM!");
    }

    if (data.status === "checked") {

      const newOrderDiv = document.createElement("div")
      newOrderDiv.classList.add("order")
      newOrderDiv.innerHTML = data.order_data

      OrderContainer.appendChild(newOrderDiv)
    }

    if (data.status === "complate") {

      const newOrderDivForDelivery = document.createElement("div")
      newOrderDivForDelivery.classList.add("order")
      newOrderDivForDelivery.innerHTML = data.order_data
      
      OrderContainerForDelivery.appendChild(newOrderDivForDelivery)
    }
  }
});
