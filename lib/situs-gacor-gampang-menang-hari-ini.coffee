SitusGacorGampangMenangHariIniView = require './situs-gacor-gampang-menang-hari-ini-view'
{CompositeDisposable} = require 'atom'

module.exports = SitusGacorGampangMenangHariIni =
  situsGacorGampangMenangHariIniView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @situsGacorGampangMenangHariIniView = new SitusGacorGampangMenangHariIniView(state.situsGacorGampangMenangHariIniViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @situsGacorGampangMenangHariIniView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'situs-gacor-gampang-menang-hari-ini:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @situsGacorGampangMenangHariIniView.destroy()

  serialize: ->
    situsGacorGampangMenangHariIniViewState: @situsGacorGampangMenangHariIniView.serialize()

  toggle: ->
    console.log 'SitusGacorGampangMenangHariIni was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
