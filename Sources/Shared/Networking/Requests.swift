import Foundation

protocol Requestable {
  var URL: NSURL { get }
  var parameters: [String: AnyObject] { get }
}

struct AccessTokenRequest: Requestable {
  let URL: NSURL
  let parameters: [String: AnyObject]

  init(code: String) throws {
    do {
      let config = try Authenticator.config()
      URL = config.token.URL

      parameters = [
        "client_id" : config.token.clientId,
        "code" : code,
        "grant_type" : config.token.accessGrantType,
        "resource" : config.token.resource,
        "redirect_uri": config.login.redirectURI
      ]
    } catch {
      throw error
    }
  }
}

struct RefreshTokenRequest: Requestable {
  let URL: NSURL
  let parameters: [String: AnyObject]

  init(code: String) throws {
    do {
      let config = try Authenticator.config()
      URL = config.token.URL

      guard let refreshToken = Authenticator.locker.refreshToken else {
        throw NSError(
          domain: Authenticator.errorDomain,
          code: Error.NoRefreshTokenFound.rawValue,
          userInfo: [NSLocalizedDescriptionKey: "No refresh token found"])
      }

      parameters = [
        "client_id" : config.token.clientId,
        "grant_type": config.token.refreshGrantType,
        "refresh_token": refreshToken,
        "resource": config.token.resource,
        "redirect_uri": config.login.redirectURI
      ]
    } catch {
      throw error
    }
  }
}
