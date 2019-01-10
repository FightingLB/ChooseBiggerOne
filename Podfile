# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

# def 后不能用大写
def test_pods
    pod 'Quick'
    pod 'Nimble'
end

target 'ChooseBiggerOne' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  target 'ChooseBiggerOneTests' do
    inherit! :search_paths
    test_pods
  end
end

target 'RefactoringDemo' do
    use_frameworks!
    
    target 'RefactoringDemoTests' do
        inherit! :search_paths
        test_pods
    end
end
