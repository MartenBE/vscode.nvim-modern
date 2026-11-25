;; extends
; Inherited by javascript, typescript and tsx.

; VS Code colors these as control flow (keyword.control), not plain keywords
[
  "break"
  "with"
] @keyword.conditional

; VS Code: storage.modifier.async (blue), while `await` stays control flow (pink)
"async" @keyword.modifier
