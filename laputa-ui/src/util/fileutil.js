

const UNITS = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB']
const STEP = 1024


export function format (value, power) {
  return (value / Math.pow(STEP, power)).toFixed(2) + UNITS[power];
}
export function readFileSizeUnit (value) {
  value = parseFloat(value, 10)
  for (var i = 0; i < UNITS.length; i++) {
    if (value < Math.pow(STEP, i)) {
      if (UNITS[i - 1]) {
        return this.format(value, i - 1)
      }
      return value + UNITS[i]
    }
  }
  return this.format(value, i - 1)
}
