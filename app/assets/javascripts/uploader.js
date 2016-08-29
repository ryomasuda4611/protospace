$(function() {
  $('.js-image-upload').each(function() {
    let preview = $(this);
    let prototype_image = $(this).find('input[type=file]');
    prototype_image.change(function() {
      if (!this.files.length) {
        alert('画像を選んでください')
      }
      var file = this.files[0]
      if (!file.type.match('image.*')) {
        alert('画像ファイルを選んでください')
      }
      const fileReader = new FileReader();
      fileReader.onload = function() {
        preview.css({
          'background-image': 'url(' + fileReader.result + ')'
        });
      };
      fileReader.readAsDataURL(file);
    });
  });
});
