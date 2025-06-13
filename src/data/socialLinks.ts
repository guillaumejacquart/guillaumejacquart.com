import type { iconPaths } from "../components/IconPaths";

export interface SocialLink {
  platform: string;
  icon: keyof typeof iconPaths;
  url: string;
  description: string;
}

export const socialLinks: SocialLink[] = [
  {
    platform: 'LinkedIn',
    icon: 'linkedin-logo',
    url: 'https://www.linkedin.com/in/guillaume-jacquart-7157185a/',
    description: 'I work at n8n'
  },
  {
    platform: 'GitHub',
    icon: 'github-logo',
    url: 'https://github.com/guillaumejacquart',
    description: "I'm a developer"
  },
  {
    platform: 'Medium',
    icon: 'medium-logo',
    url: 'https://guillaumejacquart.medium.com/',
    description: 'I write about stuff'
  },
];
