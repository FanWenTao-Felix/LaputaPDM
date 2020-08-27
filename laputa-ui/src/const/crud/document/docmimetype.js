export const tableOption = {
  'border': true,
  'index': true,
  'indexLabel': '序号',
  'stripe': true,
  'menuAlign': 'center',
  'align': 'center',
  'searchMenuSpan': 6,
  'column': [
    {
      'width': 50,
      'type': 'input',
      'label': '编号',
      'prop': 'id'
    }, {
      'type': 'input',
      'width': 240,
      'label': '类型描述',
      'prop': 'description'
    }, {
      'type': 'input',
      'label': '应用工具',
      'prop': 'application'
    }, {
      'type': 'input',
      'width': 240,
      'label': '文件类型',
      'prop': 'name'
    }, {
      'type': 'input',
      'label': '创始人',
      'prop': 'createUser'
    }, {
      'type': 'input',
      'label': '创建时间',
      'prop': 'createTime'
    }, {
      'type': 'input',
      'label': '后缀名',
      'prop': 'extensions'
    }, {
      'type': 'input',
      'width': 240,
      'label': '分类 ',
      'prop': 'mimeType'
    }
  ]
}
