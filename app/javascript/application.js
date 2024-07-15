

document.addEventListener('trix-change', function(event) {
    const editor = event.target.editor;
    const maxCharacters = 500; // Defina aqui o número máximo de caracteres permitidos
  
    // Verifica se o editor está disponível e o campo de contagem existe
    if (editor && document.getElementById('character-count')) {
      const currentLength = editor.getDocument().toString().length;
      const remainingCharacters = maxCharacters - currentLength;
      
      // Formata a string no formato "número atual / máximo"
      const countText = `${currentLength} / ${maxCharacters}`;
      
      // Atualiza o contador de caracteres
      document.getElementById('character-count').textContent = countText;
    }
  });