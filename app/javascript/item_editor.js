document.addEventListener("turbo:load", () => {
  const select = document.getElementById("todo-select");
  const editForm = document.getElementById("edit-form");
  const titleInput = document.getElementById("todo-title-input");
  const form = document.getElementById("todo-edit-form");
  const deleteButton = document.getElementById("delete-button");
  const deleteForm = document.getElementById("delete-form");

  if (!select) return;

  select.addEventListener("change", function () {
    const selectedOption = select.options[select.selectedIndex];
    const todoId = selectedOption.value;
    const todoTitle = selectedOption.dataset.title;

    if (todoId) {
      titleInput.value = todoTitle;
      form.action = `/todos/${todoId}`;
      deleteForm.action = `/todos/${todoId}`;
      editForm.style.display = "block";
    } else {
      editForm.style.display = "none";
    }
  });

  deleteButton?.addEventListener("click", function () {
    if (confirm("本当に削除しますか？")) {
      deleteForm.submit();
    }
  });
});
