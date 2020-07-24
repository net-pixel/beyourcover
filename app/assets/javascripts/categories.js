$(function(){
  function appendOption(category) {
    let html =
      `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  function appendChildrenBox(insertHTML) {
    let childSelectHtml = '';
    childSelectHtml =
      `<select class="user-form__field__category__box__children" id="children_category">
        <option value="" data-category="" >選択してください</option>
        ${insertHTML}`;
    $('#children_box').append(childSelectHtml);
  }

  function appendGrandchildrenBox(insertHTML) {
    let grandchildSelectHtml = '';
    grandchildSelectHtml =
      `<select class="user-form__field__category__box__grandchildren" id="grandchildren_category" name="article[category_id]">
        <option value="" data-category="" >選択してください</option>
        ${insertHTML}`;
    $('#grandchildren_box').append(grandchildSelectHtml);
  }

  $(document).on("change","#parent_category", function() {
    let parentCategory =  $("#parent_category").val();
    if (parentCategory != "") {
      console.log(parentCategory)
      $.ajax( {
        type: 'GET',
        url: 'get_category_children',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children) {
        $("#children_box").empty();
        $("#children_box").css('display', 'block');
        $("#grandchildren_box").empty();
        let insertHTML = '';
        children.forEach(function(child) {
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function() {
        alert('error：子カテゴリーの取得に失敗');
      })
    }else{
      $("#children_box").empty();
      $("#grandchildren_box").empty();
    }
  });

  $(document).on('change', '#children_box', function() {
    //選択された子カテゴリーidを取得
    let childId = $('#children_category option:selected').data('category');
    //子カテゴリーが初期値でない場合
    if (childId != ""){
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        datatype: 'json'
      })
      .done(function(grandchildren) {
        if (grandchildren.length != 0) {
          $("#grandchildren_box").empty();
          $("#grandchildren_box").css('display', 'block');

          let insertHTML = '';
          grandchildren.forEach(function(grandchild) {
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
        }
      })
      .fail(function() {
        alert('error:孫カテゴリーの取得に失敗');
      })
    }else{
      $("#grandchildren_box").empty();
    }
  });
});