# Accepted: Use opensubdiv for level of detail
  
## Metadata  
  
- Status: accepted <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->  
- Deciders: V-Sekai, fire
- Tags: V-Sekai  
  
## The Backdrop  
  
Creators want more. Players want more. The platform can only support a limited amount of content.

## The Challenge  

The challenge lies in optimizing the content to fit within the platform's limitations without compromising on the quality and detail.

## The Strategy  

Use OpenSubdiv to increase detail, which can then be reduced through Godot Engine's LOD (Level of Detail) scheme. This allows for high-quality models that are optimized for performance.

## The Upside  

The upside is that this approach allows for more detailed models while still maintaining good performance.

## The Downside  

The downside is that it requires additional processing to create the LOD models, which could potentially slow down the development process.

## The Road Not Taken  

An alternative approach would have been to manually create lower detail models for use in less demanding scenarios. However, this would require significantly more work from the creators.

## The Infrequent Use Case  

This strategy might not be beneficial for very simple models or scenes where the level of detail is not a significant factor.

## In Core and Done by Us?   

Yes, this strategy is implemented in the core of our platform and maintained by us.

## Further Reading  
  
- [V-Sekai](https://v-sekai.org/)  
- This article is assisted by AI.
