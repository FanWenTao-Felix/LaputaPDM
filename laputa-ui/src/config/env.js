// 配置编译环境和线上环境之间的切换

const env = process.env
const baseUrl = ''
const codeUrl = `${window.location.origin}/code`
const actUrl = `${window.location.origin}/act/modeler.html?modelId=`
if (env.NODE_ENV === 'development') {

} else if (env.NODE_ENV === 'production') {

} else if (env.NODE_ENV === 'test') {

}
export {
  baseUrl,
  actUrl,
  codeUrl,
  env
}
