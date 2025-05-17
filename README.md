# Junior League of Napa-Sonoma Website Redesign

**Team 2 – SRJC Spring 2025 Semester**  
Instructor: Ethan Wilde  
Design Lead: Kelly Durkin  
Content Lead: Helen Chen  
Scrum Master: George Bayless

⸻

## Overview

This project is a redesign of the Junior League of Napa-Sonoma public-facing website. It was merged with the existing member-side CMS for one unified website. The updated version improves accessibility, mobile responsiveness, organization and consistency, while preserving key content and navigation structure.

The project builds on Wild Apricot’s **Casefile Advocate** theme and incorporates CSS customization, structural HTML overrides, and reusable design components.

⸻

## Project File Structure

```
Root Directory
├── Colors.cfg                  # Modified theme color definitions
├── Head.tpl                   # Custom HTML head content
├── MainTemplate.tpl           # Primary layout template
├── /Styles/
│   ├── constants.less         # Edited: variables
│   └── layout.less            # Edited: breakpoints
├── /customCSS/
│   ├── WA_CSS-SHEET.css       # Main custom CSS file (see notes below)
│   ├── systemPages.css        # Overrides for Wild Apricot system pages
│   └── navbar.css             # Custom navigation styling
├── /1-Pages/
│   ├── Home.html              # Home page content (top to bottom)
│   ├── who-we-arePage.html
│   ├── how-we-helpPage.html
│   ├── ride-a-rigPage.html
│   ├── memberHome-Page.html
│   ├── joinPage.html
│   ├── grantsPage.html
│   ├── givePage.html
│   ├── done-in-a-dayPage.html
│   ├── SPAC-Page.html
│   ├── GLOW-Page.html
│   └── footer.html            # Public footer content
└── /_reusable_code_snippets/
    ├── trio.html              # Layout used for initiatives section
    ├── standard_layouts.html  # Multiple layout blocks for content reuse
    ├── clickable_hover.html   # Hover-interactive elements
    ├── cardTemplate.html      # Reusable styled content card
    └── custom-navbar.html     # Public-facing navigation bar
```

### Page Content Architecture

The /1-Pages folder contains the complete source code for each public page, laid out top-to-bottom in the same order as it appears on the live site. These are not standard html pages and cannot be  used as such. Nor are these templates —  they are the actual HTML blocks that are pasted into Wild Apricot’s content areas via the ‘html’ button in the page editor.

The website pages are set up with the Wild Apricot internal page builder with 1, 2, and 3 column ‘layouts’ inside which are placed ‘gadgets’ such as Content Areas.  The contents of these files fit directly into those structural components, preserving the custom visual presentation.

These code snippets are optional components used in multiple places on the site. Each file is meant to be copied into a content area as needed for layout and style reuse:
	* 	**trio.html** – Used in the *Initiatives* section at the bottom of How We Help, Done in a Day, SPAC, GLOW, and Museum on the Go.
	* 	**standard_layouts.html** – A library of multi-column responsive layout blocks.
	* 	**clickable_hover.html** – no longer used - has Dues/Donate links 
	* 	**cardTemplate.html** – Reusable content card, styled and ready to drop in.
	* 	**custom-navbar.html** – The public-facing site navigation bar.

⸻

These snippets allow quick reuse and are easy to copy/paste into any content area within Wild Apricot’s page editor.


------------------------------------------------------

## Responsive Design & Breakpoint Strategy

Wild Apricot’s default theme breakpoints were not optimized for mid-sized devices like tablets and small laptops. In the Case File Advocate theme, tables were styled to display well on phones (small breakpoint) and desktops (large breakpoint), but the in-between breakpoints (medium and large) produced layout issues—especially for tables, which became cramped, misaligned, or unreadable.

To resolve this, we adjusted the breakpoints in layout.less to collapse the mid-range and treat it like the small breakpoint, so table layouts would trigger mobile-friendly styles sooner and more consistently across a wider range of devices:

@Device-L-MaxWidth: 1200px;  // was 992 - 1260
@Container-L-MaxWidth: 1969px;

@Device-M-MaxWidth: 1024px;  // was 768 - 991
@Container-M-MaxWidth: 991px;

@Device-S-MaxWidth: 1023px;  // was 480 - 767
@Container-S-MaxWidth: 990px;

@Device-XS-MaxWidth: 549px;  // was 320 - 479


This approach allowed us to skip the problematic in-between breakpoints entirely, creating a more stable and readable layout across devices—especially for tables and multi-column content. It was a practical workaround to the limitations of the Wild Apricot layout engine and its rigid column and gadget structure.
--------------------------------------------------------


Summary
	•	Modified theme files are located in the root and /Styles/ folders
	•	All custom public page code is stored in the /1-Pages folder
	•	CSS must be manually pasted into Wild Apricot’s custom theme CSS section
	•	Reusable code snippets are modular and easy to integrate into content areas
	•	Breakpoints were adjusted to improve layout on mid-size devices and ensure responsive display across screen sizes
