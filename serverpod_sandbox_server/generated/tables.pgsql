--
-- Class ListItem as table sandbox_list_item
--

CREATE TABLE "sandbox_list_item" (
  "id" serial,
  "name" text NOT NULL
);

ALTER TABLE ONLY "sandbox_list_item"
  ADD CONSTRAINT sandbox_list_item_pkey PRIMARY KEY (id);


