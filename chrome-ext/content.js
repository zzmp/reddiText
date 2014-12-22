var thingSelector = 'div.content div.thing',
    imageSelector = /imgur.com/
    count = window.location.search.match(/\&|\?count\=([^&]+)/),
    base = count && count[1] + '+',
    newRank = 0

things()
  .filter(function(thing) {
    return imageSelector.test(thing.querySelector('a').href)
  })
  .forEach(function(thing) {
    thing.remove()
  })

things()
  .forEach(function(thing) {
    var rankEl, rank

    rankEl = thing.querySelector('.rank')
    rankEl && (rank = Number(rankEl.innerText))
    if (rank && Number.isInteger(rank)) {
      rankEl.setAttribute('style', 'margin-top: 0;')
      rankEl.innerHTML = [
        '<p style="opacity: 0.5; font-size: 0.5em;">',
          base,
        '</p>',
        ++newRank,
        '<s style="opacity: 0.5">',
          rank,
        '</s>']
          .join('\n')
    }
  })

function things() {
  return [].slice.call(document.querySelectorAll(thingSelector))
}
