import { Controller } from "@hotwired/stimulus"
import { cable } from "@hotwired/turbo-rails"
import { beep } from "./utils";
import { highlightElement } from "./utils";

export class ChatController extends Controller {
    connect() {
        this.subscribe()
        this.scroll()
    }

    subscribe() {
        const turboStreamFromTag = document.querySelector("turbo-cable-stream-source")
        const channelName = turboStreamFromTag.getAttribute("channel")
        const signedStreamName = turboStreamFromTag.getAttribute("signed-stream-name")
        const reaction = this.reaction;

        this.channel = cable.subscribeTo(
          {
              channel: channelName,
              signed_stream_name: signedStreamName,
          },
          {
                received (data) { setTimeout(reaction, 500) }
          }
        )
    }

    clearInput() {
        this.element.reset()
    }

    reaction = () => {
        this.scroll();
        this.highlight();
        beep();
    }

    scroll = () => {
        const chatContainer = document.getElementById("chat-container")
        if (chatContainer) chatContainer.scrollTop = chatContainer.scrollHeight
    }

    highlight = () => {
        const messages = document.getElementsByClassName("js-message");
        const lastMessage = messages[messages.length-1];
        highlightElement(lastMessage);
    }
}