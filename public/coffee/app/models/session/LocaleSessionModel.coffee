###
# All SessionModel should be instanciated as singletons
###
define [
  'app/custom/SessionModel'
  'app/models/LocaleModel'
  'app/singletons/LocaleCollectionSingleton'
], (
  SessionModel
  LocaleModel
  LocaleCollection
) ->

  LocaleSessionModel = SessionModel.extend(LocaleModel.prototype).extend
    # Reseting SessionModel constructor since is was overwriten when extending the sub model prototype
    constructor: SessionModel.prototype.constructor 

    initialize: (attrs, options) ->
      @bindEvents()

    parseSessionVars: (attrs, appVars={}) ->
      if attrs?
        return attrs
      else
        storageVars = @getStorageVars 'locale', 'local'
        if storageVars.id?
          return storageVars
        else if appVars.locale?
          return appVars.locale
        else 
          locale = LocaleCollection.get @getUserAgentLocaleId()
          return locale.toJSON()

    bindEvents: () ->
      @listenTo @, 'change', () =>
        @setStorageVars 'locale', @toJSON(), 'local'


    # Helpers
    # -------------------------------------
    getUserAgentLocaleId: () ->
      language = window.navigator.userLanguage || window.navigator.language
      languageAr = language.toLowerCase().split('-')
      id = languageAr[0]
      return id

  # ------------------------------------------------------------------
  # Instanciating as singleton
  new LocaleSessionModel()