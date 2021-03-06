class AppDelegate
  attr_accessor :status_menu

  def applicationDidFinishLaunching(notification)
    @app_name = NSBundle.mainBundle.infoDictionary['CFBundleDisplayName']

    @status_menu = NSMenu.new

    @status_item = NSStatusBar.systemStatusBar.statusItemWithLength(NSVariableStatusItemLength).init
    @status_item.setMenu(@status_menu)
    @status_item.setHighlightMode(true)
    @status_item.setTitle(@app_name)

    @status_menu.addItem createMenuItem("About #{@app_name}", 'orderFrontStandardAboutPanel:')
    @status_menu.addItem createMenuItem("Custom Action", 'pressAction')
    @status_menu.addItem createMenuItem("Eject Three Disks", 'ejectThreeDisks')
    @status_menu.addItem createMenuItem("Say Something", 'sayDroid')
    @status_menu.addItem createMenuItem("Sing", 'singSomething')
    @status_menu.addItem createMenuItem("Greetings", 'greetings')
    @status_menu.addItem createMenuItem("Quit", 'terminate:')
  end

  def createMenuItem(name, action)
    NSMenuItem.alloc.initWithTitle(name, action: action, keyEquivalent: '')
  end

  def pressAction
    alert = NSAlert.alloc.init
    alert.setMessageText "Action triggered from status bar menu"
    alert.addButtonWithTitle "OK"
    alert.runModal
  end

  def sayDroid
    %x(say -v cello droid)
  end

  def singSomething
    %x(say -v cello da da da da da da da da da da da da da da da da da da da da da da da da da da)
  end

  def greetings
    %x(say -v cello Greetings to the members of Chippewa Valley Code Camp &)
    alert = NSAlert.alloc.init
    alert.setMessageText "Greetings to the members of Chippewa Valley Code Camp!"
    alert.addButtonWithTitle "OK"
    alert.runModal
  end

  def ejectThreeDisks
    alert = NSAlert.alloc.init
    response = %x(/usr/sbin/diskutil eject SiiGBlack) + "\n"
    response += %x(/usr/sbin/diskutil eject Ultra3TB) + "\n"
    response += %x(/usr/sbin/diskutil eject WDSilver) + "\n"
    alert.setMessageText response
    alert.addButtonWithTitle "OK"
    alert.runModal
  end
end
