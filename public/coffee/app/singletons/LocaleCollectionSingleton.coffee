define [
  'app/collections/LocaleCollection'
], (LocaleCollection) ->

  localeCollection = new LocaleCollection [
    id: 'fr'
    label: 'Français'
  ,
    id: 'en'
    label: 'English' 
  ]
  return localeCollection