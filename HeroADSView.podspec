#
#  Be sure to run `pod spec lint HeroADSView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.platform     = :ios, "9.0"

  spec.name         = "HeroADSView"
  spec.version      = "1.0.3"
  spec.summary      = "My best description HeroADSView."
  spec.homepage     = "https://github.com/mickaelhero/HeroADSView"

  # spec.license      = "MIT (example)"
  spec.license      = { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  LICENSE
  }


  spec.author        = { "Mickael Belhassen" => "emoonadev@gmail.com" }
  spec.swift_version = "4.0"

  spec.source       = { :git => "https://github.com/mickaelhero/HeroADSView.git", :tag => "#{spec.version}" }
  spec.source_files  = "HeroADSView/**/*.{h,m,swift}"

end
