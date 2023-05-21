#= none:1 =# @kwdef struct update_meta_params
        #= none:2 =#
        DisableRegistration::Union{Nothing, Bool} = nothing
        #= none:3 =#
        SensitiveMediaDetectionSensitivity::Union{Nothing, String} = nothing
        #= none:4 =#
        SummalyProxy::Union{Nothing, String} = nothing
        #= none:5 =#
        ObjectStorageSecretKey::Union{Nothing, String} = nothing
        #= none:6 =#
        ObjectStorageSetPublicRead::Union{Nothing, Bool} = nothing
        #= none:7 =#
        HcaptchaSiteKey::Union{Nothing, String} = nothing
        #= none:8 =#
        ObjectStorageS3ForcePathStyle::Union{Nothing, Bool} = nothing
        #= none:9 =#
        TwitterConsumerKey::Union{Nothing, String} = nothing
        #= none:10 =#
        TwitterConsumerSecret::Union{Nothing, String} = nothing
        #= none:11 =#
        GithubClientSecret::Union{Nothing, String} = nothing
        #= none:12 =#
        DefaultLightTheme::Union{Nothing, String} = nothing
        #= none:13 =#
        TosUrl::Union{Nothing, String} = nothing
        #= none:14 =#
        EnableSensitiveMediaDetectionForVideos::Union{Nothing, Bool} = nothing
        #= none:15 =#
        DeeplIsPro::Union{Nothing, Bool} = nothing
        #= none:16 =#
        EmailRequiredForSignup::Union{Nothing, Bool} = nothing
        #= none:17 =#
        RecaptchaSiteKey::Union{Nothing, String} = nothing
        #= none:18 =#
        SmtpPass::Union{Nothing, String} = nothing
        #= none:19 =#
        ObjectStorageUseProxy::Union{Nothing, Bool} = nothing
        #= none:20 =#
        Email::Union{Nothing, String} = nothing
        #= none:21 =#
        EnableIpLogging::Union{Nothing, Bool} = nothing
        #= none:22 =#
        LocalDriveCapacityMb::Union{Nothing, Int64} = nothing
        #= none:23 =#
        ProxyAccountId::Union{Nothing, String} = nothing
        #= none:24 =#
        ObjectStorageAccessKey::Union{Nothing, String} = nothing
        #= none:25 =#
        SetSensitiveFlagAutomatically::Union{Nothing, Bool} = nothing
        #= none:26 =#
        Langs::Union{Nothing, Array} = nothing
        #= none:27 =#
        ObjectStorageEndpoint::Union{Nothing, String} = nothing
        #= none:28 =#
        HiddenTags::Union{Nothing, Array} = nothing
        #= none:29 =#
        PinnedUsers::Union{Nothing, Array} = nothing
        #= none:30 =#
        RemoteDriveCapacityMb::Union{Nothing, Int64} = nothing
        #= none:31 =#
        PinnedPages::Union{Nothing, Array} = nothing
        #= none:32 =#
        SwPublicKey::Union{Nothing, String} = nothing
        #= none:33 =#
        SmtpUser::Union{Nothing, String} = nothing
        #= none:34 =#
        UseStarForReactionFallback::Union{Nothing, Bool} = nothing
        #= none:35 =#
        EnableEmail::Union{Nothing, Bool} = nothing
        #= none:36 =#
        ObjectStoragePort::Union{Nothing, Int64} = nothing
        #= none:37 =#
        EnableRecaptcha::Union{Nothing, Bool} = nothing
        #= none:38 =#
        DeeplAuthKey::Union{Nothing, String} = nothing
        #= none:39 =#
        BackgroundImageUrl::Union{Nothing, String} = nothing
        #= none:40 =#
        IconUrl::Union{Nothing, String} = nothing
        #= none:41 =#
        ObjectStoragePrefix::Union{Nothing, String} = nothing
        #= none:42 =#
        BannerUrl::Union{Nothing, String} = nothing
        #= none:43 =#
        EnableTwitterIntegration::Union{Nothing, Bool} = nothing
        #= none:44 =#
        DefaultDarkTheme::Union{Nothing, String} = nothing
        #= none:45 =#
        ObjectStorageBaseUrl::Union{Nothing, String} = nothing
        #= none:46 =#
        MaintainerName::Union{Nothing, String} = nothing
        #= none:47 =#
        RepositoryUrl::Union{Nothing, String} = nothing
        #= none:48 =#
        ObjectStorageBucket::Union{Nothing, String} = nothing
        #= none:49 =#
        ThemeColor::Union{Nothing, String} = nothing
        #= none:50 =#
        Name::Union{Nothing, String} = nothing
        #= none:51 =#
        ObjectStorageUseSSL::Union{Nothing, Bool} = nothing
        #= none:52 =#
        EnableDiscordIntegration::Union{Nothing, Bool} = nothing
        #= none:53 =#
        SmtpPort::Union{Nothing, Int64} = nothing
        #= none:54 =#
        ErrorImageUrl::Union{Nothing, String} = nothing
        #= none:55 =#
        Description::Union{Nothing, String} = nothing
        #= none:56 =#
        SensitiveMediaDetection::Union{Nothing, String} = nothing
        #= none:57 =#
        ObjectStorageRegion::Union{Nothing, String} = nothing
        #= none:58 =#
        PinnedClipId::Union{Nothing, String} = nothing
        #= none:59 =#
        CacheRemoteFiles::Union{Nothing, Bool} = nothing
        #= none:60 =#
        MascotImageUrl::Union{Nothing, String} = nothing
        #= none:61 =#
        GithubClientId::Union{Nothing, String} = nothing
        #= none:62 =#
        DiscordClientId::Union{Nothing, String} = nothing
        #= none:63 =#
        BlockedHosts::Union{Nothing, Array} = nothing
        #= none:64 =#
        LogoImageUrl::Union{Nothing, String} = nothing
        #= none:65 =#
        SwPrivateKey::Union{Nothing, String} = nothing
        #= none:66 =#
        DisableLocalTimeline::Union{Nothing, Bool} = nothing
        #= none:67 =#
        EnableGithubIntegration::Union{Nothing, Bool} = nothing
        #= none:68 =#
        SmtpHost::Union{Nothing, String} = nothing
        #= none:69 =#
        HcaptchaSecretKey::Union{Nothing, String} = nothing
        #= none:70 =#
        EnableHcaptcha::Union{Nothing, Bool} = nothing
        #= none:71 =#
        FeedbackUrl::Union{Nothing, String} = nothing
        #= none:72 =#
        DisableGlobalTimeline::Union{Nothing, Bool} = nothing
        #= none:73 =#
        MaintainerEmail::Union{Nothing, String} = nothing
        #= none:74 =#
        SmtpSecure::Union{Nothing, Bool} = nothing
        #= none:75 =#
        UseObjectStorage::Union{Nothing, Bool} = nothing
        #= none:76 =#
        EnableActiveEmailValidation::Union{Nothing, Bool} = nothing
        #= none:77 =#
        EnableServiceWorker::Union{Nothing, Bool} = nothing
        #= none:78 =#
        DiscordClientSecret::Union{Nothing, String} = nothing
        #= none:79 =#
        RecaptchaSecretKey::Union{Nothing, String} = nothing
        #= none:81 =#
        i::String = ""
    end
""
function update_meta(server::String, params::update_meta_params)
    #= none:1 =#
    #= none:2 =#
    if true && params.i == ""
        #= none:3 =#
        error("This function require credential")
    end
    #= none:6 =#
    header = Dict("Content-Type" => "application/json")
    #= none:8 =#
    params = Dict((lowercase(string(key)) => getfield(params, key) for key = propertynames(params))) |> (x->begin
                    #= none:8 =#
                    filter((t->begin
                                    #= none:8 =#
                                    t.second != nothing
                                end), x) |> JSON.json
                end)
    #= none:9 =#
    request = HTTP.post("https://$(server)/api/admin/update_meta", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
