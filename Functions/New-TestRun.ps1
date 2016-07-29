
function New-TestRun {
   
     $test = [TestRun]::New()

     [TestingFramework]::PrivateData = $test

     return $test

}