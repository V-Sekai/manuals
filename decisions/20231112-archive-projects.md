# Proposed: Effective V-Sekai project archival strategy

## Metadata

- Status: Proposed
- Deciders: V-Sekai, fire, arne
- Tags: V-Sekai, Documentation, Project Archiving

## The Backdrop

The need for an effective project archival strategy has been highlighted by the experience of going through old projects without any structure or crucial data. This proposal aims to overcome this challenge in the context of V-Sekai projects.

## The Challenge

The main challenge is to create a structured and comprehensive archive of V-Sekai projects that will allow easy access and understanding of each project even years after its completion.

## The Strategy

The proposed strategy includes:

1. **Maintaining online projects**: If a project is hosted online, doesn't necessitate upkeep and isn't financially burdensome, it's best to keep it live for easy future reference.

2. **Structuring offline projects**: For those projects that aren't feasible to keep online, store them in your local file system. Establish a main folder with yearly subfolders for systematic organization.

3. **Capturing screenshots**: Screenshots serve as a quick visual reference of your project without the need to set it up again.

4. **Creating screen recordings**: For a more comprehensive record, consider creating a screen recording of your project—this not only captures the visual aspect but also records any audio commentary you might provide.

5. **Incorporating a README**: Include a README file that outlines the purpose of the project, its creation and abandonment dates, contributors, and instructions to get it up and running again. This provides essential information about the project at a glance.

6. **Securing the database**: In cases where projects lack a database dump, all the actual content could be lost. Execute a `sqldump` or use the export functionality your database offers to create a backup alongside your files. This ensures data preservation.

7. **Retaining generated assets**: When utilizing static site generators, include the directory containing the compiled HTML, CSS & JS in the archive. This allows you to easily browse the complete website by simply running a static file server.

8. **Archiving on the Internet Archive**: If the platform hosting your content isn't owned by you (for instance, you're publishing to Discord or Github), consider saving your data to the Archive.org. This adds an extra level of security for preserving your projects.

## The Upside

This strategy will ensure that all V-Sekai projects are well-documented and easily accessible in the future. It will also help in preserving the history and evolution of V-Sekai projects over time.

## The Downside

The process might be time-consuming and require regular updates and maintenance.

## The Road Not Taken

An alternative could be to use a cloud-based storage service for archiving projects. However, this might not provide the same level of organization and accessibility as the proposed strategy.

## The Infrequent Use Case

In cases where a project was short-lived or did not have significant impact, it might be decided to not include it in the archive.

## In Core and Done by Us?

Yes, this strategy should be implemented by the V-Sekai team as it directly affects the organization and preservation of their projects.

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine
3. [arne.me/articles/archive-your-old-projects](https://arne.me/articles/archive-your-old-projects)

This article was assisted by AI assistant Aria.
