$(function () {
  $("#post-comment").on("click", function () {
    $("#comment_comment").focus();
  });
  $(".post-like").on("click", function () {
    var post_id = $(this).data("id");

    $.ajax({
      url: "/post/like/" + post_id,
      method: "GET",
    }).done(function (response) {
      console.log(response);
    });
  });

  // document
  //   .getElementById("post-comment-index-page")
  //   .addEventListener("click", (event) => {
  //     event.preventDefault();
  //     //   debugger;
  //     console.log(document.getElementById("comment_comment").value);
  //     console.log("I am clicked");
  //   });

  // document.getElementById("search-bar").addEventListener("submit", (event) => {
  //   console.log(event.target.search.value);
  // });
});
