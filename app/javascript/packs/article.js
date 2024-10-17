import $ from "jquery";
import axios from "modules/axios";

import { listenInactiveHeartEvent, listenActiveHeartEvent } from "modules/handle_heart";

const handleHeartDisplay = (hasLiked) => {
  if (hasLiked) {
    $(".active-heart").removeClass("hidden");
  } else {
    $(".inactive-heart").removeClass("hidden");
  }
};

// コメント追加ボタンをクリックしたらテキストエリアが出現する
const hendleCommentForm = () => {
  $(".show-comment-form").on("click", () => {
    $(".show-comment-form").addClass("hidden");
    $(".comment-text-area").removeClass("hidden");
  });
};

// コメントを追加で表示する
const appendNewComment = (comment) => {
  $(".comments-container").append(`<div class="article_comment"><p>${comment.content}</p></div>`);
};

document.addEventListener("turbolinks:load", () => {
  const dataset = $("#article-show").data();
  const articleId = dataset.articleId;

  axios
    .get(`/articles/${articleId}/comments`)
    .then((response) => {
      const comments = response.data;
      comments.forEach((comment) => {
        appendNewComment(comment);
      });
    })
    .catch((error) => {
      window.alert("error");
    });

  hendleCommentForm();

  $(".add-comment-button").on("click", () => {
    const content = $("#comment_content").val();
    if (!content) {
      window.alert("コメントを入力してください");
    } else {
      axios
        .post(`/articles/${articleId}/comments`, {
          comment: { content: content },
        })
        .then((res) => {
          const comment = res.data;
          appendNewComment(comment);
          $("#comment_content").val("");
        });
    }
  });

  axios.get(`/articles/${articleId}/like`).then((response) => {
    const hasLiked = response.data.hasLiked;
    handleHeartDisplay(hasLiked);
  });

  listenInactiveHeartEvent(articleId);
  listenActiveHeartEvent(articleId);
});
