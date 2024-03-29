# Shotstack Ruby SDK <!-- omit in toc -->

Ruby SDK for the Shotstack [Ruby video editor](https://shotstack.io/product/sdk/ruby/) and cloud video editing API.

Shotstack is a cloud based video editing platform that enables the editing of videos using code.

The platform uses an API and a JSON format for specifying how videos should be edited and what asset and titles should be used.

A server based render farm takes care of rendering the videos allowing multiple videos to be created simultaneously.

For examples of how to use the SDK to create videos using code checkout the Ruby demo repo: https://github.com/shotstack/ruby-demos

## Contents <!-- omit in toc -->
- [Using the Ruby SDK](#using-the-ruby-sdk)
    - [Installation](#installation)
  - [Video Editing](#video-editing)
    - [Video Editing Example](#video-editing-example)
    - [Status Check Example](#status-check-example)
    - [Save a Template Example](#save-a-template-example)
    - [Render a Template Example](#render-a-template-example)
  - [Video Editing Schemas](#video-editing-schemas)
    - [Edit](#edit)
    - [Timeline](#timeline)
    - [Soundtrack](#soundtrack)
    - [Font](#font)
    - [Track](#track)
    - [Clip](#clip)
    - [VideoAsset](#videoasset)
    - [ImageAsset](#imageasset)
    - [TitleAsset](#titleasset)
    - [HtmlAsset](#htmlasset)
    - [AudioAsset](#audioasset)
    - [LumaAsset](#lumaasset)
    - [Transition](#transition)
    - [Offset](#offset)
    - [Crop](#crop)
    - [Transformation](#transformation)
    - [RotateTransformation](#rotatetransformation)
    - [SkewTransformation](#skewtransformation)
    - [FlipTransformation](#fliptransformation)
    - [MergeField](#mergefield)
  - [Template Schemas](#template-schemas)
    - [Template](#template)
    - [TemplateRender](#templaterender)
  - [Output Schemas](#output-schemas)
    - [Output](#output)
    - [Size](#size)
    - [Range](#range)
    - [Poster](#poster)
    - [Thumbnail](#thumbnail)
  - [Destinations](#destinations)
    - [ShotstackDestination](#shotstackdestination)
    - [MuxDestination](#muxdestination)
    - [MuxDestinationOptions](#muxdestinationoptions)
    - [S3DestinationOptions](#s3destinationoptions)
  - [Render Response Schemas](#render-response-schemas)
    - [QueuedResponse](#queuedresponse)
    - [QueuedResponseData](#queuedresponsedata)
    - [RenderResponse](#renderresponse)
    - [RenderResponseData](#renderresponsedata)
  - [Template Response Schemas](#template-response-schemas)
    - [TemplateResponse](#templateresponse)
    - [TemplateResponseData](#templateresponsedata)
    - [TemplateDataResponse](#templatedataresponse)
    - [TemplateDataResponseData](#templatedataresponsedata)
    - [TemplateListResponse](#templatelistresponse)
    - [TemplateListResponseData](#templatelistresponsedata)
    - [TemplateListResponseItem](#templatelistresponseitem)
  - [Inspecting Media](#inspecting-media)
    - [Probe Example](#probe-example)
  - [Probe Schemas](#probe-schemas)
    - [ProbeResponse](#proberesponse)
  - [Managing Assets](#managing-assets)
    - [Assets by Render ID Example](#assets-by-render-id-example)
    - [Assets by Asset ID Example](#assets-by-asset-id-example)
  - [Asset Schemas](#asset-schemas)
    - [AssetResponse](#assetresponse)
    - [AssetRenderResponse](#assetrenderresponse)
    - [AssetResponseData](#assetresponsedata)
    - [AssetResponseAttributes](#assetresponseattributes)
- [API Documentation and Guides](#api-documentation-and-guides)

# Using the Ruby SDK
### Installation

```bash
gem install shotstack
```

## Video Editing

The Shotstack SDK enables programmatic video editing via the Edit API `render` endpoint. Prepare JSON edits using the
provided schema classes and `POST` to the API for rendering.
### Video Editing Example

The example below trims the start of a video clip and plays it for 8 seconds. The edit is prepared using the SDK models
and then sent to the API for rendering.

```ruby
require "shotstack"

Shotstack.configure do |config|
  config.api_key['x-api-key'] = "H7jKyj90kd09lbLOF7J900jNbSWS67X87xs9j0cD"
  config.host = "api.shotstack.io"
  config.base_path = "stage"
end

api_client = Shotstack::EditApi.new

video_asset = Shotstack::VideoAsset.new(
  src: "https://s3-ap-southeast-2.amazonaws.com/shotstack-assets/footage/skater.hd.mp4",
  trim: 3
)

video_clip = Shotstack::Clip.new(
  asset: video_asset,
  start: 0,
  length: 8
)

track = Shotstack::Track.new(clips: [video_clip])

timeline = Shotstack::Timeline.new(
  background: "#000000",
  tracks: [track])

output = Shotstack::Output.new(
  format: "mp4",
  resolution: "sd")

edit = Shotstack::Edit.new(
  timeline: timeline,
  output: output)

response = api_client.post_render(edit).response

puts response.id
```

### Status Check Example

The example request below can be called a few seconds after the render above is posted. It will return the status of 
the render, which can take several seconds to process.

```ruby
require "shotstack"

Shotstack.configure do |config|
  config.api_key['x-api-key'] = "H7jKyj90kd09lbLOF7J900jNbSWS67X87xs9j0cD"
  config.host = "api.shotstack.io"
  config.base_path = "stage"
end

id = "75143ec6-4b72-46f8-a67a-fd7284546935" # Use the render id from the previous example
api_client = Shotstack::EditApi.new

response = api_client.get_render(id, { data: false, merged: true }).response

if response.status === "done"
  puts response.url
```

### Save a Template Example

The example below uses the Edit we create in the [Video Editing Example](#video-editing-example) and saves it as a
template. The template can be rendered at a later date and can include placeholders. Placeholders can be replaced 
when rendered using [merge fields](#mergefield).

This example uses a placeholder for the video src (URL), trim (TRIM), and length (LENGTH) to allow you to trim any video
using a template.

```ruby
require "shotstack"

Shotstack.configure do |config|
  config.api_key['x-api-key'] = "H7jKyj90kd09lbLOF7J900jNbSWS67X87xs9j0cD"
  config.host = "api.shotstack.io"
  config.base_path = "stage"
end

api_client = Shotstack::EditApi.new

video_asset = Shotstack::VideoAsset.new(
  src: "{{URL}}",
  trim: "{{TRIM}}"
)

video_clip = Shotstack::Clip.new(
  asset: video_asset,
  start: 0,
  length: "{{LENGTH}}"
)

track = Shotstack::Track.new(clips: [video_clip])

timeline = Shotstack::Timeline.new(
  background: "#000000",
  tracks: [track]
)

output = Shotstack::Output.new(
  format: "mp4",
  resolution: "sd"
)

edit = Shotstack::Edit.new(
  timeline: timeline,
  output: output
)

template = Shotstack::Template.new(
  name: "Trim Template",
  template: edit
)

response = api_client.post_template(template).response

puts response.id
```

### Render a Template Example

The example below renders the template we created in the previous example and includes merge fields that will replace
the placeholders. Once submitted use the returned render ID and call the [Status Check Example](#status-check-example)
to get the render progress.

```ruby
require "shotstack"

Shotstack.configure do |config|
  config.api_key['x-api-key'] = "H7jKyj90kd09lbLOF7J900jNbSWS67X87xs9j0cD"
  config.host = "api.shotstack.io"
  config.base_path = "stage"
end

id = "8aeabb0e-b5eb-8c5e-847d-82297dd4802a"; # use the template id from previous example
api_client = Shotstack::EditApi.new

merge_field_url = Shotstack::MergeField.new(
  find: "URL",
  replace: "https://s3-ap-southeast-2.amazonaws.com/shotstack-assets/footage/skater.hd.mp4"
)

merge_field_trim = Shotstack::MergeField.new(
  find: "TRIM",
  replace: 3
)

merge_field_length = Shotstack::MergeField.new(
  find: "LENGTH",
  replace: 6
)

template = Shotstack::TemplateRender.new(
  id: id,
  merge: [
    merge_field_url,
    merge_field_trim,
    merge_field_length
  ]
)

response = api_client.post_template_render(template).response

puts response.id
```

## Video Editing Schemas

The following schemas are used to prepare a video edit.

### Edit

An **Edit** defines the arrangement of a video on a timeline, an audio edit or an image design and the output format.

#### Example:

```ruby
require "shotstack"

edit = Shotstack::Edit.new(
  timeline: timeline,
  output: output,
  merge: merge,
  callback: "https://my-server.com/callback.php",
  disk: "local"
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
timeline | [Shotstack::Timeline](#timeline) | A timeline represents the contents of a video edit over time, an audio edit over time, in seconds, or an image layout. A timeline consists of layers called tracks. Tracks are composed of titles, images, audio, html or video segments referred to as clips which are placed along the track at specific starting point and lasting for a specific amount of time. | -
output | [Shotstack::Output](#output) | The output format, render range and type of media to generate. | Y
merge | [Shotstack::MergeField[]](#mergefield) | An array of key/value pairs that provides an easy way to create templates with placeholders. The placeholders can be used to find and replace keys with values. For example you can search for the placeholder `{{NAME}}` and replace it with the value `Jane`. | -
callback | string | An optional webhook callback URL used to receive status notifications when a render completes or fails. See [webhooks](https://shotstack.io/docs/guide/architecting-an-application/webhooks/) for  more details. | -
disk | string | **(Deprecated)** The disk type to use for storing footage and asset for each render. See [disk types](https://shotstack.io/docs/guide/architecting-an-application/disk-types/) for more details. [default to `local`] <ul><li>`local` - optimized for high speed rendering with up to 512MB storage</li><li>`mount` - optimized for larger file sizes and longer videos with 5GB for source footage and 512MB for output render</li></ul> | -

-----

### Timeline

A **Timeline** represents the contents of a video edit over time, an audio edit over time, in seconds, or an image layout. A timeline consists of layers called tracks. Tracks are composed of titles, images, audio, html or video segments referred to as clips which are placed along the track at specific starting point and lasting for a specific amount of time.

#### Example:

```ruby
require "shotstack"

timeline = Shotstack::Timeline.new(
  soundtrack: soundtrack,
  background: '#000000',
  fonts: fonts,
  tracks: tracks,
  cache: true
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
soundtrack | [Shotstack::Soundtrack](#soundtrack) | A music or audio soundtrack file in mp3 format. | -
background | string | A hexadecimal value for the timeline background colour. Defaults to `#000000` (black). | -
fonts | [Shotstack::Font[]](#font) | An array of custom fonts to be downloaded for use by the HTML assets. | -
tracks | [Shotstack::Track[]](#track) | A timeline consists of an array of tracks, each track containing clips. Tracks are layered on top of each other in the same order they are added to the array with the top most track layered over the top of those below it. Ensure that a track containing titles is the top most track so that it is displayed above videos and images. | Y
cache | bool | Disable the caching of ingested source footage and assets. See  [caching](https://shotstack.io/docs/guide/architecting-an-application/caching) for more details. [default to `true`] | -

---

### Soundtrack

A music or audio file in mp3 format that plays for the duration of the rendered video or the length of the audio file, which ever is shortest.

#### Example:

```ruby
require "shotstack"

soundtrack = Shotstack::Soundtrack.new(
  src: 'https://s3-ap-southeast-2.amazonaws.com/shotstack-assets/music/disco.mp3',
  effect: 'fadeIn',
  volume: 1
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
src | string | The URL of the mp3 audio file. The URL must be publicly accessible or include credentials. | Y
effect | string | The effect to apply to the audio file <ul><li>`fadeIn` - fade volume in only</li><li>`fadeOut` - fade volume out only</li><li>`fadeInFadeOut` - fade volume in and out</li></ul> | -
volume | float | Set the volume for the soundtrack between 0 and 1 where 0 is muted and 1 is full volume (defaults to `1`). | -

---

### Font

Download a custom font to use with the HTML asset type, using the font name in the CSS or font tag. See our [custom fonts](https://shotstack.io/learn/html-custom-fonts/) getting started guide for more details.

#### Example:

```ruby
require "shotstack"

font = Shotstack::Font.new(
  src: 'https://shotstack-assets.s3-ap-southeast-2.amazonaws.com/fonts/OpenSans-Regular.ttf'
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
src | string | The URL of the font file. The URL must be publicly accessible or include credentials. | Y

---

### Track

A track contains an array of clips. Tracks are layered on top of each other in the order in the array. The top most track will render on top of those below it.

#### Example:

```ruby
require "shotstack"

track = Shotstack::Track(
  clips: clips
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
clips | [Shotstack::Clip[]](#clip) | An array of Clips comprising of TitleClip, ImageClip or VideoClip. | Y

---

### Clip

A **Clip** is a container for a specific type of asset, i.e. a title, image, video, audio or html. You use a Clip to define when an asset will display on the timeline, how long it will play for and transitions, filters and effects to apply to it.

#### Example:

```ruby
require "shotstack"

clip = Shotstack::Clip.new(
  asset: asset,
  start: 2,
  length: 5,
  fit: 'crop',
  scale: 0,
  position: 'center',
  offset: offset,
  transition: transition,
  effect: 'zoomIn',
  filter: 'greyscale',
  opacity: 1,
  transform: transform
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
asset | asset | The type of asset to display for the duration of this Clip. Value must be one of: <ul><li>[Shotstack::VideoAsset](#videoasset)</li><li>[Shotstack::ImageAsset](#imageasset)</li><li>[Shotstack::TitleAsset](#titleasset)</li><li>[Shotstack::HtmlAsset](#htmlasset)</li><li>[Shotstack::AudioAsset](#audioasset)</li><li>[Shotstack::LumaAsset](#lumaasset)</li></ul>  | Y
start | float | The start position of the Clip on the timeline, in seconds. | Y
length | float | The length, in seconds, the Clip should play for. | Y
fit | string fit | Set how the asset should be scaled to fit the viewport using one of the following options [default to `crop`]: <ul><li>`cover` - stretch the asset to fill the viewport without maintaining the aspect ratio.</li><li>`contain` - fit the entire asset within the viewport while maintaining the original aspect ratio.</li><li>`crop` - scale the asset to fill the viewport while maintaining the aspect ratio. The asset will be cropped if it exceeds the bounds of the viewport.</li><li>`none` - preserves the original asset dimensions and does not apply any scaling.</li></ul>| -
scale | float | Scale the asset to a fraction of the viewport size - i.e. ting the scale to 0.5 will scale asset to half the size of the viewport. This is useful for picture-in-picture video and  scaling images such as logos and watermarks. | -
position | string | Place the asset in one of nine predefined positions of the viewport. This is most effective for when the asset is scaled and you want to position the element to a specific position [default to `center`].<ul><li>`top` - top (center)</li><li>`topRight` - top right</li><li>`right` - right (center)</li><li>`bottomRight` - bottom right</li><li>`bottom` - bottom (center)</li><li>`bottomLeft` - bottom left</li><li>`left` - left (center)</li><li>`topLeft` - top left</li><li>`center` - center</li></ul> | -
offset | [Shotstack::Offset](#offset) | Offset the location of the asset relative to its position on the viewport. The offset distance is relative to the width of the viewport - for example an x offset of 0.5 will move the asset half the viewport width to the right. | -
transition | [Shotstack::Transition](#transition) | In and out transitions for a clip - i.e. fade in and fade out | -
effect | string | A motion effect to apply to the Clip. <ul><li>`zoomIn` - slow zoom in</li><li>`zoomOut` - slow zoom out</li><li>`slideLeft` - slow slide (pan) left</li><li>`slideRight` - slow slide (pan) right</li><li>`slideUp` - slow slide (pan) up</li><li>`slideDown` - slow slide (pan) down</li></ul> The motion effect speed can also be controlled by appending `Fast` or `Slow` to the effect, e.g. `zoomInFast` or `slideRightSlow`.| -
filter | string | A filter effect to apply to the Clip. <ul><li>`boost` - boost contrast and saturation</li><li>`contrast` - increase contrast</li><li>`darken` - darken the scene</li><li>`greyscale` - remove colour</li><li>`lighten` - lighten the scene</li><li>`muted` - reduce saturation and contrast</li><li>`negative` - invert colors</li></ul> | -
opacity | float | s the opacity of the Clip where 1 is opaque and 0 is transparent. [default to `1`] | -
transform | [Shotstack::Transformation](#transformation) | A transformation lets you modify the visual properties of a clip. Available transformations are [Shotstack::RotateTransformation](#rotatetransformation), [Shotstack::SkewTransformation](#skewtransformation) and [Shotstack::FlipTransformation](#fliptransformation). Transformations can be combined to create interesting new shapes and effects. | -

---

### VideoAsset

The **VideoAsset** is used to create video sequences from video files. The src must be a publicly accessible URL to a video
resource such as an mp4 file.

#### Example:

```ruby
require "shotstack"

video_asset = Shotstack::VideoAsset.new(
  src: 'https://shotstack-assets.s3-ap-southeast-2.amazonaws.com/footage/table-mountain.mp4',
  trim: 5,
  volume: 0.5,
  volume_effect: 'fadeIn',
  crop: crop
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
src | string | The video source URL. The URL must be publicly accessible or include credentials. | Y
trim | float | The start trim point of the video clip, in seconds (defaults to 0). Videos will start from the in trim point. The video will play until the file ends or the Clip length is reached. | -
volume | float | Set the volume for the video clip between 0 and 1 where 0 is muted and 1 is full volume (defaults to 0). | -
volume_effect | string | The volume effect to apply to the video asset.<ul><li>`fadeIn` - fade volume in only</li><li>`fadeOut` - fade volume out only</li><li>`fadeInFadeOut` - fade volume in and out</li></ul> | -
crop | [Shotstack::Crop](#crop) | Crop the sides of an asset by a relative amount. The size of the crop is specified using a scale between 0 and 1, relative to the screen width - i.e. a left crop of 0.5 will crop half of the asset from the left, a top crop of 0.25 will crop the top by quarter of the asset. | -

---

### ImageAsset

The **ImageAsset** is used to create video from images to compose an image. The src must be a publicly accessible URL to an image resource such as a jpg or png file.

#### Example:

```ruby
require "shotstack"

image_asset = Shotstack::ImageAsset.new(
  src: 'https://shotstack-assets.s3-ap-southeast-2.amazonaws.com/images/earth.jpg',
  crop: crop
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
src | string | The image source URL. The URL must be publicly accessible or include credentials. | Y
crop | [Shotstack::Crop](#crop) | Crop the sides of an asset by a relative amount. The size of the crop is specified using a scale between 0 and 1, relative to the screen width - i.e. a left crop of 0.5 will crop half of the asset from the left, a top crop of 0.25 will crop the top by quarter of the asset. | -

---

### TitleAsset

The **TitleAsset** clip type lets you create video titles from a text string and apply styling and positioning.

#### Example:

```ruby
require "shotstack"

title_asset = Shotstack::TitleAsset.new(
  text: 'My Title',
  style: 'minimal',
  color: '#ffffff',
  size: 'medium',
  background: '#000000',
  position: 'center',
  offset: offset
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
text | string | The title text string. | Y
style | string | Uses a preset to apply font properties and styling to the title. <ul><li>`minimal`</li><li>`blockbuster`</li><li>`vogue`</li><li>`sketchy`</li><li>`skinny`</li><li>`chunk`</li><li>`chunkLight`</li><li>`marker`</li><li>`future`</li><li>`subtitle`</li></ul> | -
color | string | Set the text color using hexadecimal color notation. Transparency is supported by ting the first two characters of the hex string (opposite to HTML),  i.e. #80ffffff will be white with  50% transparency [default to `#ffffff`]. | - 
size | string | Set the relative size of the text using predefined sizes from xx-small to xx-large [default to 'medium']. <ul><li>`xx-small`</li><li>`x-small`</li><li>`small`</li><li>`medium`</li><li>`large`</li><li>`x-large`</li><li>`xx-large`</li></ul> | -
background | string | Apply a background color behind the text. Set the text color using hexadecimal color notation. Transparency is supported by ting the first two characters of the hex string (opposite to HTML),  i.e. #80ffffff will be white with 50% transparency. Omit to use transparent background. | -
position | string | Place the title in one of nine predefined positions of the viewport [default to `center`. <ul><li>`top` - top (center)</li><li>`topRight` - top right</li><li>`right` - right (center)</li><li>`bottomRight` - bottom right</li><li>`bottom` - bottom (center)</li><li>`bottomLeft` - bottom left</li><li>`left` - left (center)</li><li>`topLeft` - top left</li><li>`center` - center</li></ul> | -
offset | [Shotstack::Offset](#offset) | Offset the location of the title relative to its position on the screen. | -

---

### HtmlAsset

The **HtmlAsset** clip type lets you create text based layout and formatting using HTML and CSS. You can also set the height and width of a bounding box for the HTML content to sit within. Text and elements will wrap within the bounding box.

#### Example:

```ruby
require "shotstack"

html_asset = Shotstack::HtmlAsset.new(
  html: '<p>Hello <b>World</b></p>',
  css: 'p { color: #ffffff; } b { color: #ffff00; }',
  width: 400,
  height: 200,
  background: 'transparent',
  position: 'center'
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :---:
html | string | The HTML text string. See list of [supported HTML tags](https://shotstack.io/docs/guide/architecting-an-application/html-support/#supported-html-tags). | Y
css | string | The CSS text string to apply styling to the HTML. See list of  [support CSS properties](https://shotstack.io/docs/guide/architecting-an-application/html-support/#supported-css-properties). | -
width | int | Set the width of the HTML asset bounding box in pixels. Text will wrap to fill the bounding box. | -
height | int | Set the height of the HTML asset bounding box in pixels. Text and elements will be masked if they exceed the  height of the bounding box. | -
background | string | Apply a background color behind the HTML bounding box using. Set the text color using hexadecimal  color notation. Transparency is supported by ting the first two characters of the hex string  (opposite to HTML), i.e. #80ffffff will be white with 80% transparency [default to `transparent`]. | - 
position | string | Place the HTML in one of nine predefined positions within the HTML area [default to `center`]. <ul><li>`top` - top (center)</li><li>`topRight` - top right</li><li>`right` - right (center)</li><li>`bottomRight` - bottom right</li><li>`bottom` - bottom (center)</li><li>`bottomLeft` - bottom left</li><li>`left` - left (center)</li><li>`topLeft` - top left</li><li>`center` - center</li></ul> | -

---

### AudioAsset

The **AudioAsset** is used to add sound effects and audio at specific intervals on the timeline. The src must be a 
publicly accessible URL to an audio resource such as an mp3 file.

#### Example:

```ruby
require "shotstack"

audio_asset = Shotstack::AudioAsset.new(
  src: 'https://shotstack-assets.s3-ap-southeast-2.amazonaws.com/music/unminus/lit.mp3',
  trim: 2,
  volume: 0.5,
  effect: 'fadeInFadeOut'
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
src | string | The audio source URL. The URL must be publicly accessible or include credentials. | Y
trim | float | The start trim point of the audio clip, in seconds (defaults to 0). Audio will start from the trim point. The audio will play until the file ends or the Clip length is reached. | -
volume | float | Set the volume for the audio clip between 0 and 1 where 0 is muted and 1 is full volume (defaults to 1). | -
effect | string | The effect to apply to the audio asset: <ul><li>`fadeIn` - fade volume in only</li><li>`fadeOut` - fade volume out only</li><li>`fadeInFadeOut` - fade volume in and out</li></ul> | -

---

### LumaAsset

The **LumaAsset** is used to create luma matte masks, transitions and effects between other assets. A luma matte is a grey scale image or animated video where the black areas are transparent and the white areas solid. The luma matte animation should be provided as an mp4 video file. The src must be a publicly accessible URL to the file.

#### Example:

```ruby
require "shotstack"

luma_asset = Shotstack::LumaAsset.new(
  src: 'https://shotstack-assets.s3-ap-southeast-2.amazonaws.com/examples/luma-mattes/paint-left.mp4',
  trim: 5
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
src | string | The luma matte source URL. The URL must be publicly accessible or include credentials. | Y
trim | float | The start trim point of the luma matte clip, in seconds (defaults to 0). Videos will start from the in trim point. A luma matte video will play until the file ends or the Clip length is reached. | -

---

### Transition

The **Transition** clip type lets you define in and out transitions for a clip - i.e. fade in and fade out

#### Example:

```ruby
require "shotstack"

transition = Shotstack::Transition.new(
  in: 'fade',
  out: 'fade'
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
in | string | The transition in. Available transitions are:   <ul><li>`fade` - fade in</li><li>`reveal` - reveal from left to right</li><li>`wipeLeft` - fade across screen to the left</li><li>`wipeRight` - fade across screen to the right</li><li>`slideLeft` - move slightly left and fade in</li><li>`slideRight` - move slightly right and fade in</li><li>`slideUp` - move slightly up and fade in</li><li>`slideDown` - move slightly down and fade in</li><li>`carouselLeft` - slide in from right to left</li><li>`carouselRight` - slide in from left to right</li><li>`carouselUp` - slide in from bottom to top</li><li>`carouselDown` - slide in from top to bottom</li><li>`shuffleTopRight` - rotate in from top right</li><li>`shuffleRightTop` - rotate in from right top</li><li>`shuffleRightBottom` - rotate in from right bottom</li><li>`shuffleBottomRight` - rotate in from bottom right</li><li>`shuffleBottomLeft` - rotate in from bottom left</li><li>`shuffleLeftBottom` - rotate in from left bottom</li><li>`shuffleLeftTop` - rotate in from left top</li><li>`shuffleTopLeft` - rotate in from top left</li><li>`zoom` - fast zoom in</li></ul> The transition speed can also be controlled by appending `Fast` or `Slow` to the transition, e.g. `fadeFast` or `CarouselLeftSlow`. | -
out | string | The transition out. Available transitions are:   <ul><li>`fade` - fade out</li><li>`reveal` - reveal from right to left</li><li>`wipeLeft` - fade across screen to the left</li><li>`wipeRight` - fade across screen to the right</li><li>`slideLeft` - move slightly left and fade out</li><li>`slideRight` - move slightly right and fade out</li><li>`slideUp` - move slightly up and fade out</li><li>`slideDown` - move slightly down and fade out</li><li>`carouselLeft` - slide out from right to left</li><li>`carouselRight` - slide out from left to right</li><li>`carouselUp` - slide out from bottom to top</li><li>`carouselDown` - slide out from top  to bottom</li><li>`shuffleTopRight` - rotate out from top right</li><li>`shuffleRightTop` - rotate out from right top</li><li>`shuffleRightBottom` - rotate out from right bottom</li><li>`shuffleBottomRight` - rotate out from bottom right</li><li>`shuffleBottomLeft` - rotate out from bottom left</li><li>`shuffleLeftBottom` - rotate out from left bottom</li><li>`shuffleLeftTop` - rotate out from left top</li><li>`shuffleTopLeft` - rotate out from top left</li><li>`zoom` - fast zoom out</li></ul> The transition speed can also be controlled by appending `Fast` or `Slow` to the transition, e.g. `fadeFast` or `CarouselLeftSlow`. | -

---

### Offset

Offs the position of an asset horizontally or vertically by a relative distance.

#### Example:

```ruby
require "shotstack"

offset = Shotstack::Offset.new(
  x: 0.1,
  y: -0.2
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
x | float | Offset an asset on the horizontal axis (left or right), range varies from -10 to 10. Positive numbers move the asset right, negative left. For all asset except titles the distance moved is relative to the width  of the viewport - i.e. an X offset of 0.5 will move the asset half the  screen width to the right. [default to `0`] | -
y | float | Offset an asset on the vertical axis (up or down), range varies from -10 to 10. Positive numbers move the asset up, negative down. For all asset except titles the distance moved is relative to the height of the viewport - i.e. an Y offset of 0.5 will move the asset up half the screen height. [default to `0`] | -

---

### Crop

Crop the sides of an asset by a relative amount. The size of the crop is specified using a scale between 0 and 1, relative to the screen width - i.e a left crop of 0.5 will crop half of the asset from the left, a top crop of 0.25 will crop the top by quarter of the asset.

#### Example:

```ruby
require "shotstack"

crop = Shotstack::Crop.new(
  top: 0.15,
  bottom: 0.15,
  left: 0,
  right: 0
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
top | float | Crop from the top of the asset | -
bottom | float | Crop from the bottom of the asset | -
left | float | Crop from the left of the asset | -
right | float | Crop from the right of the asset | -

---

### Transformation

Apply one or more transformations to a clip. **Transformations** alter the visual properties of a clip and can be combined to create new shapes and effects.

#### Example:

```ruby
require "shotstack"

transformation = Shotstack::Transformation.new(
  rotate: rotate,
  skew: skew,
  flip: flip
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
rotate | [Shotstack::RotateTransformation](#rotatetransformation) | Rotate a clip by the specified angle in degrees. Rotation origin is set based on the clips `position`. | -
skew | [Shotstack::SkewTransformation](#skewtransformation) | Skew a clip so its edges are sheared at an angle. Use values between 0 and 3. Over 3 the clip will be skewed almost flat. | -
flip | [Shotstack::FlipTransformation](#fliptransformation) | Flip a clip vertically or horizontally. Acts as a mirror effect of the clip along the selected plane. | -

---

### RotateTransformation

Rotate a clip by the specified angle in degrees. Rotation origin is set based on the clips `position`.

#### Example:

```ruby
require "shotstack"

rotate_transformation = Shotstack::RotateTransformation.new(
  angle: 45
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
angle | int | The angle to rotate the clip. Can be 0 to 360, or 0 to -360. Using a positive number rotates the clip clockwise, negative numbers counter-clockwise. | -

---

### SkewTransformation

Skew a clip so its edges are sheared at an angle. Use values between 0 and 3. Over 3 the clip will be skewed almost flat.

#### Example:

```ruby
require "shotstack"

skew_transformation = Shotstack::SkewTransformation.new(
  x: 0.5,
  y: 0.5
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
x | float | Skew the clip along it&#39;s x axis. [default to `0`] | -
y | float | Skew the clip along it&#39;s y axis. [default to `0`] | -

---

### FlipTransformation

Flip a clip vertically or horizontally. Acts as a mirror effect of the clip along the selected plane.

#### Example:

```ruby
require "shotstack"

flip_transformation = Shotstack::FlipTransformation.new(
  horizontal: true,
  vertical: true
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
horizontal | bool | Flip a clip horizontally. [default to `false`] | - 
vertical | bool | Flip a clip vertically. [default to `false`] | -

---

### MergeField

A merge field consists of a key; `find`, and a `value`; replace. Merge fields can be used to replace placeholders within the JSON edit to create re-usable templates. Placeholders should be a string with double brace delimiters, i.e. `"{{NAME}}"`. A placeholder can be used for any value within the JSON edit.

#### Example:

```ruby
require "shotstack"

merge_field = Shotstack::MergeField.new(
  find: 'NAME',
  replace: 'Jane'
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
find | string | The string to find <u>without</u> delimiters. | Y
replace | replace | The replacement value. The replacement can be any valid JSON type - string, boolean, number, etc... | Y

---

## Template Schemas

The following schemas specify how to use templates to store and render templates. A template lets you save an
[Edit](#edit) that can be rendered by its template ID and optionally include merge fields that are merged with the
template when rendered.

### Template

A template is a saved [Edit](#edit) than can be loaded and re-used.

#### Example:

```ruby
require "shotstack"

template = Shotstack::Template.new(
  name: 'My Template',
  template: edit
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
name | string | The template name. | Y
template | [Shotstack::Edit](#edit) | An edit defines the arrangement of a video on a timeline, an audio edit or an image design and the output format. | Y

### TemplateRender

Configure the id and optional merge fields to render a template by id.

#### Example:


```ruby
require "shotstack"

template = Shotstack::TemplateRender.new(
  id: '21e781c0-8232-4418-fec1-cc99f0280c21',
  merge: merge
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
id | string | The id of the template to render in UUID format. | Y
merge | [Shotstack::MergeField[]](#mergefield) | An array of key/value pairs that provides an easy way to create templates with placeholders. The placeholders can be used to find and replace keys with values. For example you can search for the placeholder `{{NAME}}` and replace it with the value `Jane`. | -

---

## Output Schemas

The following schemas specify the output format and tings.
### Output

The output format, render range and type of media to generate.

#### Example:

```ruby
require "shotstack"

output = Shotstack::Output.new(
  format: 'mp4',
  resolution: 'sd',
  aspectRatio: '16:9',
  size: size,
  fps: 25,
  scale_to: 'preview',
  quality: 'medium',
  repeat: true,
  mute: false,
  range: range,
  poster: poster,
  thumbnail: thumbnail,
  destinations: destinations
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
format | string | The output format and type of media file to generate. <ul><li>`mp4` - mp4 video file</li><li>`gif` - animated gif</li><li>`jpg` - jpg image file</li><li>`png` - png image file</li><li>`bmp` - bmp image file</li><li>`mp3` - mp3 audio file (audio only)</li></ul> | Y
resolution | string | The output resolution of the video or image. <ul><li>`preview` - 512px x 288px @ 15fps</li><li>`mobile` - 640px x 360px @ 25fps</li><li>`sd` - 1024px x 576px @ 25fps</li><li>`hd` - 1280px x 720px @ 25fps</li><li>`1080` - 1920px x 1080px @ 25fps</li></ul> | -
aspectRatio | string | The aspect ratio (shape) of the video or image. Useful for social media output formats. Options are: <ul><li>`16:9` - regular landscape/horizontal aspect ratio (default)</li><li>`9:16` - vertical/portrait aspect ratio</li><li>`1:1` - square aspect ratio</li><li>`4:5` - short vertical/portrait aspect ratio</li><li>`4:3` - legacy TV aspect ratio</li></ul> | -
size | [Shotstack::Size](#size) | Set a custom size for a video or image. When using a custom size omit the `resolution` and `aspectRatio`. Custom sizes must be divisible by 2 based on the encoder specifications. | -
fps | float | Override the default frames per second. Useful for when the source footage is recorded at 30fps, i.e. on  mobile devices. Lower frame rates can be used to add cinematic quality (24fps) or to create smaller file size/faster render times or animated gifs (12 or 15fps). Default is 25fps. <ul><li>`12` - 12fps</li><li>`15` - 15fps</li><li>`23.976` - 23.976fps</li><li>`24` - 24fps</li><li>`29.97` - 29.97fps</li><li>`25` - 25fps</li><li>`30` - 30fps</li></ul> | - 
scaleTo | string | Override the resolution and scale the video or image to render at a different size. When using scaleTo the asset should be edited at the resolution dimensions, i.e. use font sizes that look best at HD, then use scaleTo to output the file at SD and the text will be scaled to the correct size. This is useful if you want to create multiple asset sizes. <ul><li>`preview` - 512px x 288px @ 15fps</li><li>`mobile` - 640px x 360px @ 25fps</li><li>`sd` - 1024px x 576px @25fps</li><li>`hd` - 1280px x 720px @25fps</li><li>`1080` - 1920px x 1080px @25fps</li></ul> | -
quality | string | Adjust the output quality of the video, image or audio. Adjusting quality affects  render speed, download speeds and storage requirements due to file size. The default `medium` provides the most optimized choice for all three  factors. <ul><li>`low` - slightly reduced quality, smaller file size</li><li>`medium` - optimized quality, render speeds and file size</li><li>`high` - slightly increased quality, larger file size</li></ul> | -
repeat | bool | Loop tings for gif files. Set to `true` to loop, `false` to play only once. [default to `true`] | -
mute | bool | Mute the audio track of the output video. Set to `true` to mute, `false` to un-mute. | -
range | [Shotstack::Range](#range) | Specify a time range to render, i.e. to render only a portion of a video or audio file. Omit this ting to export the entire video. Range can also be used to render a frame at a specific time point - ting a range and output format as `jpg` will output a single frame image at the range `start` point. | -
poster | [Shotstack::Poster](#poster) | Generate a poster image from a specific point on the timeline. | -
thumbnail | [Shotstack::Thumbnail](#thumbnail) | Generate a thumbnail image from a specific point on the timeline. | -
destinations | [Shotstack::Destinations[]](#destinations) | A destination is a location where output files can be sent to for serving or hosting. By default all rendered assets are automatically sent to the Shotstack hosting destination. | -

---

### Size

Set a custom size for a video or image. When using a custom size omit the `resolution` and `aspectRatio`. Custom sizes must be divisible by 2 based on the encoder specifications.

#### Example:

```ruby
require "shotstack"

size = Shotstack::Size.new(
  width: 1200,
  height: 800
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
width | int | Set a custom width for the video or image file. Value must be divisible by 2. Maximum video width is 1920px, maximum image width is 4096px. | -
height | int | Set a custom height for the video or image file. Value must be divisible by 2. Maximum video height is 1920px, maximum image height is 4096px. | -

---

### Range

Specify a time range to render, i.e. to render only a portion of a video or audio file. Omit this ting to export the entire video. Range can also be used to render a frame at a specific time point - ting a range and output format as `jpg` will output a single frame image at the range `start` point.

#### Example:

```ruby
require "shotstack"

range = Shotstack::Range.new(
  start: 3,
  length: 6
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
start | float | The point on the timeline, in seconds, to start the render from - i.e. start at second 3. | -
length | float | The length of the portion of the video or audio to render - i.e. render 6 seconds of the video. | -

---

### Poster

Generate a **Poster** image for the video at a specific point from the timeline. The poster image size will match the size of the output video.

#### Example:

```ruby
require "shotstack"

poster = Shotstack::Poster.new(
  capture: 1
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
capture | float | The point on the timeline in seconds to capture a single frame to use as the poster image. | Y

---

### Thumbnail

Generate a thumbnail image for the video or image at a specific point from the timeline.

#### Example:

```ruby
require "shotstack"

thumbnail = Shotstack::Thumbnail.new(
  capture: 1,
  scale: 0.3
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
capture | float | The point on the timeline in seconds to capture a single frame to use as the thumbnail image. | Y
scale | float | Scale the thumbnail size to a fraction of the viewport size - i.e. ting the scale to 0.5 will scale  the thumbnail to half the size of the viewport. | Y

---

## Destinations

### ShotstackDestination

Send rendered asset to the Shotstack hosting and CDN service. This destination is enabled by default.

#### Example:

```ruby
require "shotstack"

shotstack_destination = Shotstack::ShotstackDestination.new(
  provider: 'shotstack',
  exclude: false
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
provider | string | The destination to send rendered assets to - set to `shotstack` for Shotstack. | Y
exclude | bool | Set to `true` to opt-out from the Shotstack hosting and CDN service. All files must be downloaded within 24 hours of rendering. [default to `false`] | -

### MuxDestination

Send rendered videos to the [Mux](https://shotstack.io/docs/guide/serving-assets/destinations/mux) video hosting and
streaming service. Mux credentials are required and added via the 
[dashboard](https://dashboard.shotstack.io/integrations/mux), not in the request.

#### Example:

```ruby
require "shotstack"

mux_destination = Shotstack::MuxDestination.new(
  provider: 'mux',
  options: mux_destination_options
)
```
#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
provider | string | The destination to send rendered assets to - set to `mux` for Mux. | Y
options | [Shotstack::MuxDestinationOptions](#muxdestinationoptions) | Additional Mux configuration and features. | - 

### MuxDestinationOptions

Pass additional options to control how Mux processes video. Currently supports playback policy option.

#### Example:

mux_destination_options = Shotstack::MuxDestinationOptions.new(
  playback_policy: ['public']
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
playback_policy | [string] | Sets the Mux `playback_policy` option. Value is an array of strings - use **public**, **signed**, or both. | -  

### S3Destination

Send rendered videos to an [Amazon S3](https://shotstack.io/docs/guide/serving-assets/destinations/s3) bucket. Send 
files to any region with your own prefix and filename. AWS credentials are required and added via the 
[dashboard](https://dashboard.shotstack.io/integrations/s3), not in the request.

#### Example:

```python
require "shotstack"

const s3_destination = new Shotstack::S3Destination.new(
  provider: 's3',
  options: S3_destination_options
)
```
#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
provider | string | The destination to send rendered assets to - set to `s3` for S3. | Y
options | [S3DestinationOptions](#s3destinationoptions) | Additional S3 configuration options. | - 

### S3DestinationOptions

Pass additional options to control how files are stored in S3.

#### Example:

```python
require "shotstack"

const s3_destination_options = new Shotstack::S3DestinationOptions.new(
  region: 'us-east-1',
  bucket: 'my-bucket',
  prefix: 'my-renders',
  filename: 'my-file',
  acl: 'public-read',
)
```

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
region | string | Choose the region to send the file to. Must be a valid [AWS region](https://docs.aws.amazon.com/general/latest/gr/s3.html#s3_region) string like `us-east-1` or `ap-southeast-2` | Y
bucket | string | The bucket name to send files to. The bucket must exist in the AWS account before files can be sent. | Y
prefix | string | A prefix for the file being sent. This is typically a folder name, i.e. `videos` or `customerId/videos`. | -
filename | string | Use your own filename instead of the default render ID filename. Note: omit the file extension as this will be appended depending on the output format. Also `-poster.jpg` and `-thumb.jpg` will be appended for poster and thumbnail images. | -
acl | string | Sets the S3 Access Control List (acl) permissions. Default is `private`. Must use a valid  S3 [Canned ACL](https://docs.aws.amazon.com/AmazonS3/latest/userguide/acl-overview.html#canned-acl). | -

---

## Render Response Schemas

The following schemas are returned by the render request and status request.

### QueuedResponse

The response received after a [render request](https://shotstack.io/docs/api/#render-asset) is submitted. The render task is queued for rendering and a unique render id is returned.

#### Attributes:

Attribute | Type | Description | Required
:--- | :--- | :--- | :---: 
success | bool | `true` if successfully queued, else `false`. | Y
message | string | `Created`, `Bad Request` or an error message. | Y
response | [Shotstack::QueuedResponseData](#queuedresponsedata) | `QueuedResponseData` or an error message. | Y

---

### QueuedResponseData

The **QueuedResponseData** is the response data returned with the [QueuedResponse](#queuedresponse).

#### Attributes:

Attribute | Type | Description | Required
:--- | :--- | :--- | :---: 
message | string | Success response message or error details. | Y
id | string | The id of the render task in UUID format. | Y

---

### RenderResponse

The **RenderResponse** is the response received after a [render status request](https://shotstack.io/docs/api/#get-render-status) is submitted. The response includes details about status of a render and the output URL.

#### Attributes:

Attribute | Type | Description | Required
:--- | :--- | :--- | :---: 
success | bool | `true` if status available, else `false`. | Y
message | string | `OK` or an error message. | Y
response | [Shotstack::RenderResponseData](#renderresponsedata) | `RenderResponse` or an error message. | Y

---

### RenderResponseData

The **RenderResponseData** is the response data returned with the [RenderResponse](https://shotstack.io/docs/api/#tocs_renderresponse) request including status and URL.

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
id | string | The id of the render task in UUID format. | Y
owner | string | The owner id of the render task. | Y
plan | string | The customer subscription plan. | -
status | string | The status of the render task. <ul>   <li>`queued` - render is queued waiting to be rendered</li><li>`fetching` - asset are being fetched</li><li>`rendering` - the asset is being rendered</li><li>`saving` - the final asset is being saved to storage</li><li>`done` - the asset is ready to be downloaded</li><li>`failed` - there was an error rendering the asset</li></ul> | Y
error | string | An error message, only displayed if an error occurred. | -
duration | float | The output video or audio length in seconds. | -
render_time | float | The time taken to render the asset in milliseconds. | -
url | string | The URL of the final asset. This will only be available if status is done. This is a temporary URL and will be deleted after 24 hours. By default all asset are copied to the Shotstack hosting and CDN destination. | -
poster | string | The URL of the poster image if requested. This will only be available if status is done. | -
thumbnail | string | The URL of the thumbnail image if requested. This will only be available if status is done. | -
data | [Shotstack::Edit](#edit) | The timeline and output data to be rendered. | Y
created | string | The time the render task was initially queued. | Y
updated | string | The time the render status was last updated. | Y

---

## Template Response Schemas

The following schemas are returned by the templates endpoint, including create, update and rendering a template.

### TemplateResponse

The response received after a [template](#create-template) is submitted. The template is saved and a unique
template id is returned.

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
success | bool | `true` if successfully created, else `false`. | Y
message | string | `Created`, `Bad Request` or an error message. | Y
response | [Shotstack::TemplateResponseData](#templateresponsedata) | `TemplateResponseData` or an error message. | Y

### TemplateResponseData

The response data returned with the [Shotstack.TemplateResponse](#templateresponse).

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
message | string | Success response message or error details. | Y
id | string | The unique id of the template in UUID format. | Y

### TemplateDataResponse

The template data including the template name and [Edit](#edit).

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
success | bool | `true` if successfully returned, else `false`. | Y
message |  string | `OK`, `Bad Request` or an error message. | Y
response | [Shotstack::TemplateDataResponseData](#templatedataresponsedata) | `TemplateDataResponseData` or an error message. | Y

### TemplateDataResponseData

The response data returned with the [TemplateDataResponse](#templatedataresponse).

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
id | string | The unique id of the template in UUID format. | Y
name | string | The template name. | Y
owner | string | The owner id of the templates. | Y
template [Shotstack::Edit](#edit) | `Edit` or an error message. | Y

### TemplateListResponse

A list of previously saved templates.

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---:
success | bool | `true` if successfully returned, else `false`. | Y
message | string | `OK`, `Bad Request` or an error message. | Y
response | [Shotstack::TemplateListResponseData](#templatelistresponsedata) | `TemplateListResponseData` or an error message. | Y

### TemplateListResponseData

The response data returned with the [TemplateListResponse](#templatelistresponse).

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
owner | bool | The owner id of the templates. | Y
templates | [Shotstack::TemplateListResponseItem[]](#templatelistresponseitem) | The list of templates. | Y

### TemplateListResponseItem

The individual template item returned with the [TemplateListResponseData](#templatelistresponsedata) templates
list.

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
id | string | The unique id of the template in UUID format. | Y
name | string | The template name | Y
created | string | The time the template was created. | -
updated | string | The time the template was last updated. | -

---
## Inspecting Media

The SDK `probe` endpoint can be used to inspect media hosted online. Simply pass the URL of an asset to inspect.
### Probe Example

The example below inspects (probes) a video hosted on GitHub and returns metadata about the file.

```ruby
require "shotstack"

Shotstack.configure do |config|
  config.api_key['x-api-key'] = "H7jKyj90kd09lbLOF7J900jNbSWS67X87xs9j0cD"
  config.host = "api.shotstack.io"
  config.base_path = "stage"
end

url = "https://github.com/shotstack/test-media/raw/main/captioning/scott-ko.mp4"
api_client = Shotstack::EditApi.new

begin
  response = api_client.probe(url).response
rescue => error
  abort("Request failed: #{error.message}")
end

response[:metadata][:streams].each_with_index do |stream, index|
  if stream[:codec_type] === 'video'
    puts "Example settings for: #{response[:metadata][:format][:filename]}"
    puts "Width: #{stream[:width]}px"
    puts "Height: #{stream[:height]}px"
    puts "Framerate: #{stream[:r_frame_rate]} fps"
    puts "Duration: #{stream[:duration]} secs"
  end
end
```
## Probe Schemas

The following schemas are returned by the probe request.
### ProbeResponse

The **ProbeResponse** is the response returned after a [probe request](https://shotstack.io/docs/api/#inspect-media) is submitted. The probe requests returns data from FFprobe formatted as JSON.

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
success | bool | `true` if media successfully read, else `false`. | Y
message | string | `Created`, `Bad Request` or an error message. | Y
response | object | The response from FFprobe in JSON format | Y

---

## Managing Assets

By default, all assets generated by the editing API are hosted by Shotstack and served via our CDN. The SDK provides
access to the Serve API to retrieve information about hosted files. Files can also be deleted.

### Assets by Render ID Example

The example below uses a render ID to look up hosted assets associated with the render. Note that multiple assets can be
created for a render, i.e. video, thumb and poster. Each asset has a unique asset ID different to the render ID.

```ruby
require "shotstack"

Shotstack.configure do |config|
  config.api_key['x-api-key'] = "H7jKyj90kd09lbLOF7J900jNbSWS67X87xs9j0cD"
  config.host = "api.shotstack.io"
  config.base_path = "serve/stage"
end

id = "140924c6-077d-4334-a89f-94befcfc0155"
api_client = Shotstack::ServeApi.new

begin
  data = api_client.get_asset_by_render_id(id).data
rescue => error
  abort("Request failed: #{error.message}")
end

data.each do |asset|
  case asset.attributes.status
  when "failed"
    puts ">> Something went wrong, asset could not be copied."
  else
    puts "Status: #{asset.attributes.status}"
    puts ">> Asset CDN URL: #{asset.attributes.url}"
    puts ">> Asset ID: #{asset.attributes.id}"
    puts ">> Render ID: #{asset.attributes.render_id}"
  end
end
```

### Assets by Asset ID Example

Every asset has a unique asset ID, the example below looks up an asset by its asset ID.

```ruby
require "shotstack"

Shotstack.configure do |config|
  config.api_key['x-api-key'] = "H7jKyj90kd09lbLOF7J900jNbSWS67X87xs9j0cD"
  config.host = "api.shotstack.io"
  config.base_path = "serve/stage"
end

id = "ed43eae3-4825-4c03-979d-f7dc47b9997c"
api_client = Shotstack::ServeApi.new

begin
  asset = api_client.get_asset(id).data
rescue => error
  abort("Request failed: #{error.message}")
end

case asset.attributes.status
when "failed"
  puts ">> Something went wrong, asset could not be copied."
else
  puts "Status: #{asset.attributes.status}"
  puts ">> Asset CDN URL: #{asset.attributes.url}"
  puts ">> Asset ID: #{asset.attributes.id}"
  puts ">> Render ID: #{asset.attributes.render_id}"
end
```

## Asset Schemas

The following schemas are returned by requests to the Serve API.
### AssetResponse

The **AssetResponse** is the response returned by the Serve API [get asset](https://shotstack.io/docs/api/#get-asset) request. Includes details of a hosted video, image, audio file, thumbnail or poster image. The response follows  the [json:api](https://jsonapi.org/) specification.

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
data | [Shotstack::AssetResponseData](#assetresponsedata) | Returns an asset resource. | -

---

### AssetRenderResponse

The **AssetRenderResponse** is the response returned by the Serve API [get asset by render id](https://shotstack.io/docs/api/#get-asset-by-render-id) request. The response is an array of asset resources, including video, image, audio, thumbnail and poster image. The response follows  the [json:api](https://jsonapi.org/) specification.

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
data | [Shotstack::AssetResponseData[]](#assetresponsedata) | Returns an array of asset resources grouped by render id. | -

---

### AssetResponseData

The **AssetResponseData** contains the type of resource (an asset) and attributes of the asset.

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---: 
type | string | The type of resource, in this case it is an `asset`. | -
attributes | [Shotstack::AssetResponseAttributes](#assetresponseattributes) | The asset attributes including render id, url, filename, file size, etc... | -

---

### AssetResponseAttributes

The **AssetResponseAttributes** contains the list of asset attributes and their values.

#### Arguments:

Argument | Type | Description | Required
:--- | :--- | :--- | :---:
id | string | The unique id of the hosted asset in UUID format. | -
owner | string | The owner id of the render task. | -
region | string | The region the asset is hosted, currently only `au` (Australia). | -
render_id | string | The original render id that created the asset in UUID format. Multiple asset can share the same render id. | -
filename | string | The asset file name. | -
url | string | The asset file name. | -
status | string | The status of the asset. <ul><li>`importing` - the asset is being copied to the hosting service</li><li>`ready` - the asset is ready to be served to users</li><li>`failed` - the asset failed to copy or delete</li><li>`deleted` - the asset has been deleted</li></ul> | -
created | string | The time the asset was created. | -
updated | string | The time the asset status was last updated. | -

# API Documentation and Guides

- [Getting Started Guide](https://shotstack.io/docs/guide/getting-started/core-concepts/)
- [API Reference](https://shotstack.io/docs/api/)
- [Examples](https://github.com/shotstack/ruby-demos)
- [Shotstack Website](https://shotstack.io)
