import Sortable from "sortablejs";

document.addEventListener('turbo:load', function() {
  const sortable = new Sortable(document.getElementById('sortable'), {
    onEnd: function(evt) {
      const noteId = evt.item.dataset.id;
      const newPosition = evt.newIndex;

      // Update the note's position using AJAX
      fetch(`/notes/${noteId}/update_position`, {
        method: 'PATCH',
        body: JSON.stringify({ position: newPosition }),
        headers: { 'Content-Type': 'application/json' }
      });
    }
  });
});
