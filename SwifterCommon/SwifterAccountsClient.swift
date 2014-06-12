//
//  SwifterAccountsClient.swift
//  Swifter
//
//  Copyright (c) 2014 Matt Donnelly.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
import Accounts
import Social

class SwifterAccountsClient: SwifterClientProtocol {

    var credential: SwifterCredential?

    init(account: ACAccount) {
        self.credential = SwifterCredential(account: account)
    }

    func requestWithPath(path: String, baseURL: NSURL, method: String, parameters: Dictionary<String, AnyObject>, progress: SwifterHTTPRequest.ProgressHandler?, success: SwifterHTTPRequest.SuccessHandler?, failure: SwifterHTTPRequest.FailureHandler?) {
        var requestMethod = method == "POST" ? SLRequestMethod.POST : SLRequestMethod.GET

        let url = NSURL(string: path, relativeToURL: baseURL)

        var params = Dictionary<String, String>()
        for (key, value: AnyObject) in parameters {
            params[key] = "\(value)"
        }

        let socialRequest = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: requestMethod, URL: url, parameters: params)
        socialRequest.account = self.credential!.account!

        let request = SwifterHTTPRequest(request: socialRequest.preparedURLRequest())
        request.parameters = parameters
        request.progressHandler = progress
        request.successHandler = success
        request.failureHandler = failure

        request.start()
    }

    func get(path: String, baseURL: NSURL, parameters: Dictionary<String, AnyObject>, progress: SwifterHTTPRequest.ProgressHandler?, success: SwifterHTTPRequest.SuccessHandler?, failure: SwifterHTTPRequest.FailureHandler?) {
        let url = NSURL(string: path, relativeToURL: baseURL)

        var params = Dictionary<String, String>()
        for (key, value: AnyObject) in parameters {
            params[key] = "\(value)"
        }

        let socialRequest = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: url, parameters: params)
        socialRequest.account = self.credential!.account!

        let request = SwifterHTTPRequest(request: socialRequest.preparedURLRequest())
        request.parameters = parameters
        request.progressHandler = progress
        request.successHandler = success
        request.failureHandler = failure
        
        request.start()
    }

    func post(path: String, baseURL: NSURL, parameters: Dictionary<String, AnyObject>, progress: SwifterHTTPRequest.ProgressHandler?, success: SwifterHTTPRequest.SuccessHandler?, failure: SwifterHTTPRequest.FailureHandler?) {
        let url = NSURL(string: path, relativeToURL: baseURL)

        var params = Dictionary<String, String>()
        for (key, value: AnyObject) in parameters {
            params[key] = "\(value)"
        }

        let socialRequest = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.POST, URL: url, parameters: params)
        socialRequest.account = self.credential!.account!

        let request = SwifterHTTPRequest(request: socialRequest.preparedURLRequest())
        request.parameters = parameters
        request.progressHandler = progress
        request.successHandler = success
        request.failureHandler = failure
        
        request.start()    }

}
