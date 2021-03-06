cask 'daylite' do
  if MacOS.version <= :high_sierra
    version '6.5.11'
    sha256 'fc49b73a961dc4814fcc6dec7179a41d0eccfaa849dcbabb3ea400fe6588f5eb'
    url "https://download.marketcircle.com/daylite/daylitedma#{version.no_dots}.dmg"
    pkg 'Install Daylite & Mail Assistant.pkg'
  else
    version '6.6.2'
    sha256 'c92f73d42c889e172fb917c0782dc744452d1da128b74a888aaa57f2d4be64f6'
    url "https://download.marketcircle.com/daylite/daylitedma#{version.no_dots}.pkg"
    pkg "daylitedma#{version.no_dots}.pkg"
  end

  appcast 'https://www.marketcircle.com/appcasts/daylite.xml'
  name 'Daylite'
  homepage 'https://www.marketcircle.com/'

  uninstall pkgutil:   [
                         'com.marketcircle.pkg.DLBase',
                         'com.marketcircle.pkg.DMABase',
                         'com.marketcircle.daylite.installer',
                         'com.marketcircle.daylite.mailassistant.installer',
                       ],
            launchctl: [
                         'com.marketcircle.persistence.autoupdate',
                         'com.marketcircle.Daylite-Helper',
                       ],
            signal:    [
                         ['TERM', 'com.marketcircle.daylite'],
                         ['TERM', 'com.marketcircle.persistence.autoupdate'],
                         ['KILL', '*.com.marketcircle.Daylite-Helper'],
                       ]

  zap trash: [
               '~/Library/Application Support/com.marketcircle.daylite',
               '~/Library/Caches/com.marketcircle.daylite',
               '~/Library/Caches/com.plausiblelabs.crashreporter.data/com.marketcircle.daylite',
               '~/Library/Group Containers/*.com.marketcircle.daylite',
               '~/Library/Preferences/com.marketcircle.daylite.plist',
               '~/Library/Saved Application State/com.marketcircle.daylite.savedState',
             ]
end
