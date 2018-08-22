relocateByYear = ->
  yearSelection = document.getElementById 'year'
  yearSelection.addEventListener 'change', ->
    location.href = yearSelection.value

setYearSelection = ->
  yearSelection = document.getElementById 'year'
  selectedOption = yearSelection.querySelector("option[selected='selected']")
  if selectedOption?
    yearSelection.value = selectedOption.value
  else
    yearSelection.selected = true

onPageLoad 'bodies#show', relocateByYear
# ブラウザの戻るボタンからだと記録年を選択するリストボックスが戻らないため明示的にセットし直す
onPageShow 'bodies#show', setYearSelection
