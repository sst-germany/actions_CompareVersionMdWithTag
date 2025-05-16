# actions_CompareVersionMdWithTag

This action will read the content of the first line of the "VERSION.md" file and compare it to
the tag name.

The tag name is expected to be of scheme "releases/v{version}".

If both are equal, the workflow proceeds, otherwise it is terminated with EXIT.