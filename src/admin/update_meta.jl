@kwdef struct update_meta_params
SensitiveMediaDetectionSensitivity::Union{Nothing, String} = nothing
SummalyProxy::Union{Nothing, String} = nothing
ObjectStorageS3ForcePathStyle::Union{Nothing, Bool} = nothing
SensitiveMediaHosts::Union{Nothing, Array} = nothing
TosUrl::Union{Nothing, String} = nothing
DeeplIsPro::Union{Nothing, Bool} = nothing
EmailRequiredForSignup::Union{Nothing, Bool} = nothing
EnableFanoutTimeline::Union{Nothing, Bool} = nothing
RecaptchaSiteKey::Union{Nothing, String} = nothing
SmtpPass::Union{Nothing, String} = nothing
SilencedHosts::Union{Nothing, Array} = nothing
SetSensitiveFlagAutomatically::Union{Nothing, Bool} = nothing
ObjectStorageEndpoint::Union{Nothing, String} = nothing
EnableIdenticonGeneration::Union{Nothing, Bool} = nothing
HiddenTags::Union{Nothing, Array} = nothing
TruemailInstance::Union{Nothing, String} = nothing
EnableTruemailApi::Union{Nothing, Bool} = nothing
EnableEmail::Union{Nothing, Bool} = nothing
ObjectStoragePort::Union{Nothing, Int64} = nothing
DeeplAuthKey::Union{Nothing, String} = nothing
IconUrl::Union{Nothing, String} = nothing
ObjectStorageBucket::Union{Nothing, String} = nothing
MaintainerName::Union{Nothing, String} = nothing
RepositoryUrl::Union{Nothing, String} = nothing
SensitiveWords::Union{Nothing, Array} = nothing
NotFoundImageUrl::Union{Nothing, String} = nothing
ThemeColor::Union{Nothing, String} = nothing
Name::Union{Nothing, String} = nothing
PerUserListTimelineCacheMax::Union{Nothing, Int64} = nothing
SensitiveMediaDetection::Union{Nothing, String} = nothing
EnableMcaptcha::Union{Nothing, Bool} = nothing
ObjectStorageRegion::Union{Nothing, String} = nothing
TruemailAuthKey::Union{Nothing, String} = nothing
MascotImageUrl::Union{Nothing, String} = nothing
PerRemoteUserUserTimelineCacheMax::Union{Nothing, Int64} = nothing
BlockedHosts::Union{Nothing, Array} = nothing
EnableChartsForFederatedInstances::Union{Nothing, Bool} = nothing
ShortName::Union{Nothing, String} = nothing
HcaptchaSecretKey::Union{Nothing, String} = nothing
ImpressumUrl::Union{Nothing, String} = nothing
EnableHcaptcha::Union{Nothing, Bool} = nothing
EnableActiveEmailValidation::Union{Nothing, Bool} = nothing
EnableTurnstile::Union{Nothing, Bool} = nothing
SmtpSecure::Union{Nothing, Bool} = nothing
UseObjectStorage::Union{Nothing, Bool} = nothing
EnableServiceWorker::Union{Nothing, Bool} = nothing
ServerRules::Union{Nothing, Array} = nothing
McaptchaInstanceUrl::Union{Nothing, String} = nothing
DisableRegistration::Union{Nothing, Bool} = nothing
ObjectStorageSecretKey::Union{Nothing, String} = nothing
ObjectStorageSetPublicRead::Union{Nothing, Bool} = nothing
HcaptchaSiteKey::Union{Nothing, String} = nothing
DefaultLightTheme::Union{Nothing, String} = nothing
EnableSensitiveMediaDetectionForVideos::Union{Nothing, Bool} = nothing
CacheRemoteSensitiveFiles::Union{Nothing, Bool} = nothing
ObjectStorageUseProxy::Union{Nothing, Bool} = nothing
Email::Union{Nothing, String} = nothing
EnableIpLogging::Union{Nothing, Bool} = nothing
ProxyAccountId::Union{Nothing, String} = nothing
EnableServerMachineStats::Union{Nothing, Bool} = nothing
App192IconUrl::Union{Nothing, String} = nothing
ObjectStorageAccessKey::Union{Nothing, String} = nothing
Langs::Union{Nothing, Array} = nothing
PreservedUsernames::Union{Nothing, Array} = nothing
FeaturedGameChannels::Union{Nothing, Array} = nothing
PinnedUsers::Union{Nothing, Array} = nothing
BannedEmailDomains::Union{Nothing, Array} = nothing
SwPublicKey::Union{Nothing, String} = nothing
VerifymailAuthKey::Union{Nothing, String} = nothing
SmtpUser::Union{Nothing, String} = nothing
TurnstileSecretKey::Union{Nothing, String} = nothing
UrlPreviewDenyList::Union{Nothing, Array} = nothing
EnableRecaptcha::Union{Nothing, Bool} = nothing
EnableChartsForRemoteUser::Union{Nothing, Bool} = nothing
McaptchaSiteKey::Union{Nothing, String} = nothing
BackgroundImageUrl::Union{Nothing, String} = nothing
TurnstileSiteKey::Union{Nothing, String} = nothing
ObjectStoragePrefix::Union{Nothing, String} = nothing
BannerUrl::Union{Nothing, String} = nothing
McaptchaSecretKey::Union{Nothing, String} = nothing
ServerErrorImageUrl::Union{Nothing, String} = nothing
DefaultDarkTheme::Union{Nothing, String} = nothing
ObjectStorageBaseUrl::Union{Nothing, String} = nothing
ManifestJsonOverride::Union{Nothing, String} = nothing
ObjectStorageUseSSL::Union{Nothing, Bool} = nothing
SmtpPort::Union{Nothing, Int64} = nothing
NotesPerOneAd::Union{Nothing, Int64} = nothing
EnableFanoutTimelineDbFallback::Union{Nothing, Bool} = nothing
Description::Union{Nothing, String} = nothing
CacheRemoteFiles::Union{Nothing, Bool} = nothing
PrivacyPolicyUrl::Union{Nothing, String} = nothing
LogoImageUrl::Union{Nothing, String} = nothing
SwPrivateKey::Union{Nothing, String} = nothing
PerLocalUserUserTimelineCacheMax::Union{Nothing, Int64} = nothing
SmtpHost::Union{Nothing, String} = nothing
App512IconUrl::Union{Nothing, String} = nothing
PerUserHomeTimelineCacheMax::Union{Nothing, Int64} = nothing
EnableVerifymailApi::Union{Nothing, Bool} = nothing
FeedbackUrl::Union{Nothing, String} = nothing
MaintainerEmail::Union{Nothing, String} = nothing
InfoImageUrl::Union{Nothing, String} = nothing
RecaptchaSecretKey::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:meta*
=#
function update_meta(params::update_meta_params)
    if params.i == "" && true
        error("/admin/update-meta: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/update-meta"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

