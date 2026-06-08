// src/content.config.ts
import { defineCollection } from "astro:content";
import { z } from "astro/zod";
import { file } from "astro/loaders";

const zippers = defineCollection({
  loader: file("data/zippers.json"),
  schema: z.object({
    color: z.string(),
    image: z.string(),
    link: z.url(),
    order: z.number(),
  }),
});

const threads = defineCollection({
  loader: file("data/threads.json"),
  schema: z.object({
    link: z.url(),
    name: z.string(),
    order: z.number(),
  }),
});

const colorMappings = defineCollection({
  loader: file("data/colormappings.json"),
  schema: z.object({
    gtda: z.string().optional(),
    gtdp: z.string().optional(),
    gtsa: z.string().optional(),
    jtd: z.string().optional(),
    spt: z.string().optional(),
  }),
});

export const collections = { zippers, threads, colorMappings };
